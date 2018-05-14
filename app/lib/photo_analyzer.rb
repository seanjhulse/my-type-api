class PhotoAnalyzer
    # sample response
    # resp = rekognition.detect_labels(
    #     image: {
    #         s3_object: {
    #             bucket: "my-type",
    #             name: 'uploads/photo/photo/1/sample-birds.jpeg'
    #         }
    #     })

    def initialize(id)
        # grab photo by ID
        @photo = Photo.find(id)

        # creat client for the photo
        creds = JSON.load(File.read('config/initializers/secrets.json'))
        creds = Aws::Credentials.new(creds['AccessKeyId'], creds['SecretAccessKey'])

        # rekognition client is created
        @rekognition = Aws::Rekognition::Client.new(region: 'us-east-1', credentials: creds)
    end

    def get_face_details
        # Returns the labels object

        photo_url = "uploads/photo/photo/#{@photo.id}/#{@photo.photo.path}"
    
        response = @rekognition.detect_faces(
            image: {
                s3_object: {
                    bucket: "my-type",
                    name: @photo.photo.path
                }
            }
        )
        return response.face_details
    end
end
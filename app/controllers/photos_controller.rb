class PhotosController < ApplicationController
    include Response
    include ExceptionHandler

    before_action :set_photo, except: [:index, :new, :create]

    def index
        @photos = Photo.all
        json_response(@photos)
    end
    def new
        @photo = Photo.new
    end
    def create
        @user = User.find(photo_params[:user_id])
        @photo = Photo.new(photo_params)
        @photo.save
        analyzer = PhotoAnalyzer.new(@photo.id)
        face = analyzer.get_face_details()
        @user.face = face
        @user.save
        json_response(@photo)
    end
    def show
        json_response(@photo)
    end
    def edit
        json_response(@photo)
    end
    def update
        json_response(@photo)
    end
    def destroy
        @photo.destroy
        json_response(@photo)
    end

    private
    def set_photo
        @photo = Photo.find(params[:id])
    end

    def photo_params
        params.require(:photo).permit(:user_id, :photo)
    end
end
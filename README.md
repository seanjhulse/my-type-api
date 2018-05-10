An API to send photos, login data, and location data

## Models.

### Humans.

*Contain*
- Age
- Biography
- Name
- Photo_ids
- Ratings

### Photos.

*Contain*
- Photo_URLs 

### Ratings.

*Contain*
- Photo_id
- Rating
- User_id


Sally provides a photo. Bob rates the photo. Bob's rating is tied to the photo. The algorithm compares matrix of photos with weights of ratings in Bob's profile. Finds photos closely matches to Bob's rating.
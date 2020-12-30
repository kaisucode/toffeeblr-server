
# About 
Toffeeblr!!

Built with Ruby on Rails & MySQL

## TODO
- [x] Users and authentication with JWT
- [x] Model and controller tests
- [ ] Use proper error codes
- [ ] [Route to username instead of ID for users](https://stackoverflow.com/a/7735324)
- [ ] Posts resource
- [ ] Following/follower relationship
- [ ] Update token when username is updated
- [ ] Add user bio and avatar


## Resources & REST API table
| URL/ENDPOINT     | VERB   | DESCRIPTION                         |
|------------------|--------|-------------------------------------|
| /auth/login      | POST   | Logs in user and returns token      |
| /users/          | POST   | Creates user { username, password } |
| /users/{user_id} | GET    | Returns info                        |
| /users/{user_id} | PUT    | Updates user info { content }       |
| /users/{user_id} | DELETE | Destroys user                       |

## Error Codes
- 200 success
- 201 created
- 401 auth error
- 409 conflict
- 422 unprocessible entity

--- 

## Models

### Users
- username :string
- passwordDigest :string
- bio :text
- avatar :image

- :has_many relationships
- :has_many posts
- :has_many liked_posts

### Relationships
- follower_id :integer
- followed_id :integer
- created_at :datetime
- updated_at :datetime

### Posts
- title :string
- content :text
- user_id :integer


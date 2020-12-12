
# About 
Toffeeblr!!

Built with Ruby on Rails & MySQL

## TODO
- [x] Users and authentication with JWT
- [x] Model and controller tests
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

--- 

### Models
Users
- username :string
- password :string
- token :string
- bio :text
- avatar :image

- :has_many relationships
- :has_many posts
- :has_many liked_posts

Relationships
- follower_id :integer
- followed_id :integer
- created_at :datetime
- updated_at :datetime

Posts
- content :text


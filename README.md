
# About 
Toffeeblr!!

Built with Ruby on Rails & MySQL

## TODO
- [x] Users and authentication with JWT
- [x] Model and controller tests
- [x] Use proper error codes
- [x] Posts resource
- [x] Save username in posts? or at least return usernames in the api (edit: used jbuilder)
- [x] [Route to username instead of ID for users](https://stackoverflow.com/a/7735324)
- [x] Following/follower relationship
- [ ] Post likes
- [ ] Add user bio and avatar
- [ ] Image posts
- [ ] Pagination
- [ ] Safe-guard more rendered data with jbuilder
- [ ] Tags
- [ ] Comments / Reblogs


## Resources & REST API table
| URL/ENDPOINT              | VERB   | DESCRIPTION                          |
|---------------------------|--------|--------------------------------------|
| /auth/login               | POST   | Logs in user and returns token       |
| /feed/                    | GET    | Displays feed                        |
| /explore/                 | GET    | Displays all posts                   |
| /usernames/{username}     | GET    | Returns info                         |

| /users/                   | GET    | Displays all users                   |
| /users/                   | POST   | Creates user { username, password }  |
| /users/{user_id}          | GET    | Returns info                         |
| /users/{user_id}          | PUT    | Updates user info { content }        |
| /users/{user_id}          | DELETE | Destroys user                        |

| /relationships/           | POST   | Follows user { username }            |
| /relationships/{username} | DELETE | Unfollows user                       |

| /posts/                   | POST   | Creates post { title, content }      |
| /posts/{post_id}          | PUT    | Updates post info { title, content } |
| /posts/{post_id}          | DELETE | Destroys post                        |


## Error Codes In Use
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

### Posts (belongs to user)
- title :string
- content :text
- user :references


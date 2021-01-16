
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
- [x] Improve the `Explore` endpoint
- [x] Currently follower/following timestamp is not working correctly; use `active_relationships` and `passive_relationships` attributes instead and make a new endpoint
- [x] Post likes
- [ ] Tags
- [x] Comments
- [ ] Reblogs

- [ ] Add user bio and avatar
- [ ] Image posts
- [ ] Pagination
- [ ] Safe-guard more rendered data with jbuilder
- [ ] Clean up routes and specify methods


## Resources & REST API table
| URL/ENDPOINT              | VERB   | DESCRIPTION                           |
|---------------------------|--------|---------------------------------------|
| /auth/login               | POST   | Logs in user and returns token        |
| /auth/self                | GET    | Returns username and relationship #'s |
| /feed/                    | GET    | Displays feed                         |
| /explore/                 | GET    | Displays all posts                    |
| /usernames/{username}     | GET    | Returns info                          |
| /someposts/               | POST   | Returns posts from { [post_ids] }     |
|                           |        |                                       |
| /users/                   | GET    | Displays all users                    |
| /users/                   | POST   | Creates user { username, password }   |
| /users/{user_id}          | GET    | Returns info                          |
| /users/{user_id}          | PUT    | Updates user info { content }         |
| /users/{user_id}          | DELETE | Destroys user                         |
|                           |        |                                       |
| /relationships/           | GET    | Gets user relationships               |
| /relationships/           | POST   | Follows user { username }             |
| /relationships/{username} | DELETE | Unfollows user                        |
|                           |        |                                       |
| /posts/                   | POST   | Creates post { title, content, parent_id } |
| /posts/{post_id}          | PUT    | Updates post info { title, content }  |
| /posts/{post_id}          | DELETE | Destroys post                         |
| /posts/{post_id}/like     | GET    | Like post                             |
| /posts/{post_id}/unlike   | GET    | Unlike post                           |
| /posts/{post_id}/comments | POST   | Creates a comment { content }         |


## Error Codes In Use
- 200 success
- 201 created
- 401 auth error
- 409 conflict
- 422 unprocessible entity


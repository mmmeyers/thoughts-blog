- Now comments can be tied to the user who makes them.
- You can't currently see posts unless you are a registered user.
- There are three types of users:
  - Admin: Can CRUD everything
  - Author: Can CRUD their own posts and comments
  - Regular: Still haven't configured, but will be able to just read posts and comments but not comment
- What do we want to do next?
  - Create abilities for regular user - what is it, what can they do and how do we implement that?
  X Add edit/update to posts - now a user can edit their own post and they get an error msg when trying to update someone else's post
  - Add edit/update to comments
  X Add delete to posts
  - Add delete to comments
  - Make it look nice
  - How is user type determined? I think if you register, you can be an author and if not, you can be regular. How to show all posts along with comments to regular users?
    - Work on post authorization
    - Work on comment authorization

- The admin should also see links to each user's name so she can go in and edit them easily, OR when admin logs in and posts index page is displayed, she should be able to see a link to all users index too.
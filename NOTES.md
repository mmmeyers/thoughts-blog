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

X The admin should also see links to each user's name so she can go in and edit them easily, OR when admin logs in and posts index page is displayed, she should be able to see a link to all users index too.


Currently, if you post a comment as a Regular user, you are not able to edit that comment. Comment instances do not have a user_id associated with them. How do we assign a user_id to a comment when it is created?

Now, we do have a user_id associated with a comment, but how to use that to make sure that only that user_id can edit that comment? Right now, anyone can edit any comment.

Ok now a user can't edit a comment that isn't theirs. However, this shows up when they get to the actual comment edit page and hit submit - redirects with an "access denied" to the post index page.
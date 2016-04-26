- Now comments can be tied to the user who makes them.
- You can't currently see posts unless you are a registered user.
- There are three types of users:
  - Admin: Can CRUD everything
  - Author: Can CRUD their own posts and comments
  - Regular: Still haven't configured, but will be able to just read posts and comments but not comment
- What do we want to do next?
  - Create abilities for regular user - what is it, what can they do and how do we implement that?
  X Add edit/update to posts - now a user can edit their own post and they get an error msg when trying to update someone else's post
  X Add edit/update to comments
  X Add delete to posts
  - Add delete to comments
  - Make it look nice
  - How is user type determined? I think if you register, you can be an author and if not, you can be regular. How to show all posts along with comments to regular users?
    - Work on post authorization
    - Work on comment authorization

X The admin should also see links to each user's name so she can go in and edit them easily, OR when admin logs in and posts index page is displayed, she should be able to see a link to all users index too.


-------FIXED----------------------------------------------------------------------------------------------
Currently, if you post a comment as a Regular user, you are not able to edit that comment. Comment instances do not have a user_id associated with them. How do we assign a user_id to a comment when it is created?

Now, we do have a user_id associated with a comment, but how to use that to make sure that only that user_id can edit that comment? Right now, anyone can edit any comment.

Ok now a user can't edit a comment that isn't theirs. However, this shows up when they get to the actual comment edit page and hit submit - redirects with an "access denied" to the post index page. Also, a user can't even edit their own comment - why??
----------------------------------------------------------------------------------------------------------


REQUIREMENTS
X - Use the Ruby on Rails framework.
X - Your models must include a has_many, a belongs_to, and a has_many :through relationship. You can include more models to fill out your domain, but there must be at least a model acting as a join table for the has_many through.
X - The join model must also store an additional attribute describing the relationship. For example, in a blog domain with comments by users, you'd have a posts table and a users table, with the comments table containing the foreign key for the post_id and the user_id along with the comment's content.
- Your models should include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
- You must include at least one class level ActiveRecord scope methods. To some extent these class scopes can be added to power a specific individual feature, such as "My Overdue Tasks" in a TODO application, scoping all tasks for the user by a datetime scope for overdue items, @user.tasks.overdue. Reports make for a good usage of class scopes, such as "Most Valuable Cart by Customer" where the code would implement a Cart.most_valuable and Cart.by_customer which could be combined as Cart.most_valuable.by_customer(@customer).
- You must include a nested form that writes to an associated model through a custom attribute writer. An example of this would be a New Recipe form that allowed you to add ingredients that are unique across recipes (thereby requiring a join model, or imagine being able to see all recipes that include Chicken), along with a quantity or description of the ingredient in the recipe. On this form you would have a series of fields named recipe[ingredient_attributes][0][name] and recipe[ingredient_attributes][0][description] which would write to the recipe model through a method ingredient_attributes=. This method cannot be provided via the accepts_nested_attributes_for macro because the custom writer would be responsible for finding or creating a recipe by name and then creating the row in the join model recipe_ingredients with the recipe_id, the ingredient_id, and the description from the form.
X - Your application must provide a standard user authentication, including signup, login, logout, and passwords. You can use Devise but given the complexity of that system, you should also feel free to roll your own authentication logic.
- Your authentication system should allow login from some other service. Facebook, twitter, foursquare, github, etc...
X - You must make use of a nested resource with the appropriate RESTful URLs. Additionally, your nested resource must provide a form that relates to the parent resource. Imagine an application with user profiles. You might represent a person's profile via the RESTful URL of /profiles/1, where 1 is the primary key of the profile. If the person wanted to add pictures to their profile, you could represent that as a nested resource of /profiles/1/pictures, listing all pictures belonging to profile 1. The route /profiles/1/pictures/new would allow to me upload a new picture to profile 1.
- Your forms should correctly display validation errors. Your fields should be enclosed within a fields_with_errors class and error messages describing the validation failures must be present within the view.
- Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app. Logic present in your controllers should be encapsulated as methods in your models. Your views should use helper methods and partials to be as logic-less as possible. Follow patterns in the Rails Style Guide and the Ruby Style Guide.
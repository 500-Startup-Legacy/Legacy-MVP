# Legacy-MVP

##Overview

Legacy is a time-spanning social media app.  A person can create an account, find other people using Legacy, and "memorialize" those people by creating "memories" (think "posts") about them.  When a person passes away, their "Legacy" can be viewed at a public URL.  This will display all the memories other users have created about them.

For a quick demonstration: 

1.  visit https://legacy-staging.herokuapp.com/ (our staging branch).

2.  click on the "Sign in" link

3.  in the email field, put `edbrooks214@gmail.com`, and in the password field put `foobar`

4.  you  will be taken to Ed's dashboard, where you can see the two users he is memorializing: Abraham Lincoln and Collin Meyers

5.  you can also see that Collin Meyers is memorializing him

6.  click on the "Memories" link

7.  Now you can see all the memories Ed has created about anyone.

8.  Click on the linkk "See all memories about Abraham" (notice there is no corresponding link for Collin - Collin isn't dead yet, but Abraham is)

9.  This takes you to the public page where Abraham is being memorialized.  Here you can see not only memories Ed has created about Abraham, but also memories other users have created about Abraham.

##General

-  [X]  fix authorization

-  [X]  add validation to `Relationship` so a `User` cannot memorialize another `User` that they have already memorialized

##Phase I

-  [X]  a `User` sign up

-  [X]  a `User` sign in

-  [X]  a `User` sign out

-  [X]  a `User` can memorialize anothe `User`

-  [X] a `User` can can view posts the `User` himself has made about other `Users`

-  [X]  a `User` can have a Memory of another `User`

-  [X]  a `User` can view posts a deceased `User` has has released 

##Phase II-A (Twilio)

-  [X]  add `group_tag` field to `Relationship` model

-  [X]  add form for `User` to choose another `User` to `memorialize`

-  [X]  add mobile phone number field to  `User` model

    -  [ ]  form specifies phone number (from Twilio) the `User` can text to create a new `Memory` for the memorialized

-  [ ]  create method that will create new `Memory` from text


##Phase II-B (Ziggeo)


##Phase II-C (Front End)


##Nice To Haves for Later

-  [ ]  setup Heroku to run Puma server instead of Webrick 

-  [ ]  Set up SSL (easy for heroku-app domain, more involved for custom domain)

##Getting started

After cloning, run `bundle` to get all the gems you need.  Run `rake db:create` (we're using Postgresql for development), then `rake db:migrate`.  Load up the database with some dummy data by running `rake db:seed`.


##Models and Relationships between Models

###User

A `User` has a first name, last name, email address (must be unique), and a password (actually we just save the password digest).  For example:

```ruby
ed = User.create(first_name:'Ed', last_name: 'Brooks', email:'edbrooks214@gmail.com', password: 'foobar', password_confirmation: 'foobar')
#=>#<User:0x007fe64ebc3c20 id: 10, first_name: "Ed", last_name: "Brooks", email: "edbrooks214@gmail.com", ...>
collin = User.create(first_name:'Collin', last_name: 'Meyers', email:'cfmeyers@gmail.com', password: 'foobar', password_confirmation: 'foobar')
#=>#<User:0x007fe64ebf16c0 id: 9, first_name: "Collin", last_name: "Meyers", email: "cfmeyers@gmail.com",...>

```

A `User` can "memorialize" another `User` using the `memorialize!` method, like so:

```ruby
ed.memorialize!(collin)
```

Under the hood this method actually creates a `Relationship` model that maps the two users together:

```ruby
ed.relationships
#=> [#<Relationship:0x007fe64eae1190 id: 2, memorializer_id: 10, memorialized_id: 9, ...>] 
```

We can get an array of the `Users` that `ed` has memorialized with the `memorialized_users` method:

```ruby
ed.memorialized_users
#=>[#<User:0x007fe64ae1d088 id: 9, first_name: "Collin", last_name: "Meyers", email: "cfmeyers@gmail.com",...>]
```

Right now `ed` hasn't been memorialized by anyone, so if we call the `memorializers` method:

```ruby
ed.memorializers
#=>[]
```

we get back an empty array.  However, if we call `memorializers` with `collin`:

```ruby
collin.memorializers
#=>[#<User:0x007fe64a9b2958 id: 10, first_name: "Ed", last_name: "Brooks", email: "edbrooks214@gmail.com",...>]
```

we get back an array with one element (the `User` `ed`).

Later we will add a phone number field to `User` facilitate text messaging.

###Memory

A `User` can have a `Memory` of another `User`.

To access the memories other `User`s have created for a given `User`, use the `#remembrances` method.

Currently a `Memory` has a `content` field (just text).  Later on the application will be expanded to have picture fields and possibly video fields. 


###Seed.rb

To bulk update the database on your local machine, run

```ruby
rake db:seed
```

To bulk update the database on Heroku, run

```ruby
heroku run rake db:seed
```

The following lines in the `seeds.rb` file: 

```ruby
User.delete_all
Relationship.delete_all
Memory.delete_all
```

ensure that all the `User`, `Relationship`, and `Memory` models in the database from before are deleted whenever the seed file is run.

Since we do not yet have Twilio set up, the only way to add a `Memory` is either through the seeds file or through the Rails console.

###Tests

Testing is done with [RSpec](http://rspec.info/).  To run the tests on the command line, either use the `rspec` command or, if that doesn't work, `bundle exec rspec`.


###Routes
```
                    Prefix    Verb   URI Pattern                                                               Controller#Action

                     sessions POST   /sessions(.:format)                                                       sessions#create
                  new_session GET    /sessions/new(.:format)                                                   sessions#new
                      session DELETE /sessions/:id(.:format)                                                   sessions#destroy
   user_memorialized_memories GET    /users/:user_id/memorialized/:memorialized_id/memories(.:format)          memories#index
                              POST   /users/:user_id/memorialized/:memorialized_id/memories(.:format)          memories#create
 new_user_memorialized_memory GET    /users/:user_id/memorialized/:memorialized_id/memories/new(.:format)      memories#new
edit_user_memorialized_memory GET    /users/:user_id/memorialized/:memorialized_id/memories/:id/edit(.:format) memories#edit
     user_memorialized_memory GET    /users/:user_id/memorialized/:memorialized_id/memories/:id(.:format)      memories#show
                              PATCH  /users/:user_id/memorialized/:memorialized_id/memories/:id(.:format)      memories#update
                              PUT    /users/:user_id/memorialized/:memorialized_id/memories/:id(.:format)      memories#update
                              DELETE /users/:user_id/memorialized/:memorialized_id/memories/:id(.:format)      memories#destroy
      user_memorialized_index GET    /users/:user_id/memorialized(.:format)                                    memorialized#index
                              POST   /users/:user_id/memorialized(.:format)                                    memorialized#create
        new_user_memorialized GET    /users/:user_id/memorialized/new(.:format)                                memorialized#new
       edit_user_memorialized GET    /users/:user_id/memorialized/:id/edit(.:format)                           memorialized#edit
            user_memorialized GET    /users/:user_id/memorialized/:id(.:format)                                memorialized#show
                              PATCH  /users/:user_id/memorialized/:id(.:format)                                memorialized#update
                              PUT    /users/:user_id/memorialized/:id(.:format)                                memorialized#update
                              DELETE /users/:user_id/memorialized/:id(.:format)                                memorialized#destroy
                        users GET    /users(.:format)                                                          users#index
                              POST   /users(.:format)                                                          users#create
                     new_user GET    /users/new(.:format)                                                      users#new
                    edit_user GET    /users/:id/edit(.:format)                                                 users#edit
                         user GET    /users/:id(.:format)                                                      users#show
                              PATCH  /users/:id(.:format)                                                      users#update
                              PUT    /users/:id(.:format)                                                      users#update
                              DELETE /users/:id(.:format)                                                      users#destroy
                         root GET    /                                                                         static_pages#home
                       signup GET    /signup(.:format)                                                         users#new
                       signin GET    /signin(.:format)                                                         sessions#new
                      signout DELETE /signout(.:format)                                                        sessions#destroy
                              GET    /remember/:user_id(.:format)                                              remember#show
```





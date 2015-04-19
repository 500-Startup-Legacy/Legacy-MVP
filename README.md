# Legacy-MVP

##Phase I

-  [X]  a `User` sign up

-  [X]  a `User` sign in

-  [X]  a `User` sign out

-  [X]  a `User` can memorialize anothe `User`

-  [X] a `User` can can view posts the `User` himself has made about other `Users`

-  [X]  a `User` can have a Memory of another `User`

-  [X]  a `User` can view posts a deceased `User` has has released 

##Nice To Haves for Later

-  [ ]  setup Heroku to run Puma server instead of Webrick 

-  [ ]  Set up SSL (easy for heroku-app domain, more involved for custom domain)


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

###Routes

```
          Prefix Verb   URI Pattern                                 Controller#Action
        sessions POST   /sessions(.:format)                         sessions#create
     new_session GET    /sessions/new(.:format)                     sessions#new
         session DELETE /sessions/:id(.:format)                     sessions#destroy
   user_memories GET    /users/:user_id/memories(.:format)          memories#index
                 POST   /users/:user_id/memories(.:format)          memories#create
 new_user_memory GET    /users/:user_id/memories/new(.:format)      memories#new
edit_user_memory GET    /users/:user_id/memories/:id/edit(.:format) memories#edit
     user_memory GET    /users/:user_id/memories/:id(.:format)      memories#show
                 PATCH  /users/:user_id/memories/:id(.:format)      memories#update
                 PUT    /users/:user_id/memories/:id(.:format)      memories#update
                 DELETE /users/:user_id/memories/:id(.:format)      memories#destroy
           users GET    /users(.:format)                            users#index
                 POST   /users(.:format)                            users#create
        new_user GET    /users/new(.:format)                        users#new
       edit_user GET    /users/:id/edit(.:format)                   users#edit
            user GET    /users/:id(.:format)                        users#show
                 PATCH  /users/:id(.:format)                        users#update
                 PUT    /users/:id(.:format)                        users#update
                 DELETE /users/:id(.:format)                        users#destroy
            root GET    /                                           static_pages#home
          signup GET    /signup(.:format)                           users#new
          signin GET    /signin(.:format)                           sessions#new
         signout DELETE /signout(.:format)                          sessions#destroy
                 GET    /remember/:user_id(.:format)                remember#show

```





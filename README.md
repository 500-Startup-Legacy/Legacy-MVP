# Legacy-MVP

##Phase I

-  [X]  a User sign up

-  [X]  a User sign in

-  [X]  a User sign out

-  [ ]  User Dashboard

    -  [ ] a user can can view posts the user himself has made about other people


##Other Phases
-  [ ]  Set up SSL (easy for heroku-app domain, more involved for custom domain)

-  [ ]  a user can view posts a deceased user has has released 

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








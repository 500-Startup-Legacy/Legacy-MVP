User.delete_all
Relationship.delete_all
collin = User.create(first_name:'Collin', last_name: 'Meyers', email:'cfmeyers@gmail.com', password: 'foobar', password_confirmation: 'foobar')
ed = User.create(first_name:'Ed', last_name: 'Brooks', email:'edbrooks214@gmail.com', password: 'foobar', password_confirmation: 'foobar')
abraham = User.create(first_name:'Abraham', last_name: 'Lincoln', email:'abe@gmail.com', password: 'foobar', password_confirmation: 'foobar')

collin.memorialize!(abraham)
ed.memorialize!(abraham)
ed.memorialize!(collin)




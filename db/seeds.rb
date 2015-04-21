User.delete_all
Relationship.delete_all
Memory.delete_all

collin = User.create(first_name:'Collin', last_name: 'Meyers', email:'cfmeyers@gmail.com', password: 'foobar', password_confirmation: 'foobar')
ed = User.create(first_name:'Ed', last_name: 'Brooks', email:'edbrooks214@gmail.com', password: 'foobar', password_confirmation: 'foobar')
abraham = User.create(first_name:'Abraham', last_name: 'Lincoln', email:'abe@gmail.com', password: 'foobar', password_confirmation: 'foobar', public:true)
alex = User.create(first_name:'alex', last_name: 'wang', email:'alexwang949@gmail.com', password: 'foobar', password_confirmation: 'foobar', public:true)

collin.memorialize!(abraham)
collin.memorialize!(ed)
ed.memorialize!(abraham)
ed.memorialize!(collin)

ed.memories.create(content:'He was our greatest president.', memorialized_user_id: abraham.id)
ed.memories.create(content:'What a sharp dresser!', memorialized_user_id: collin.id)


collin.memories.create(content:'Love this guy!', memorialized_user_id: abraham.id)
collin.memories.create(content:'Sunnyside fo evah!', memorialized_user_id: ed.id)

alex.memories.create(content:'Love this guy!', memorialized_user_id: abraham.id)
alex.memories.create(content:'Love this guy!', memorialized_user_id: ed.id)
alex.memories.create(content:'He was a badass mofo', memorialized_user_id: collin.id)
alex.memories.create(content:'Glad he"s dead!', memorialized_user_id: collin.id)
alex.memories.create(content:'Love this guy!', memorialized_user_id: ed.id)
alex.memories.create(content:'He owes me money', memorialized_user_id: abraham.id)


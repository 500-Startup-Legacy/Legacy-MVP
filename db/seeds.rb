User.delete_all
Relationship.delete_all
Memory.delete_all

collin = User.create(first_name:'Collin', last_name: 'Meyers', email:'cfmeyers@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'7038287113')
ed = User.create(first_name:'Ed', last_name: 'Brooks', email:'edbrooks214@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'9178227288')
abraham = User.create(first_name:'Abraham', last_name: 'Lincoln', email:'abe@gmail.com', password: 'foobar', password_confirmation: 'foobar', public:true, phone_number: '2222222222')

collin.memorialize!(abraham, "friend")
collin.memorialize!(ed, "family")
ed.memorialize!(abraham, "coworker")
ed.memorialize!(collin, "family")

ed.memories.create(content:'He was our greatest president.', memorialized_user_id: abraham.id)
ed.memories.create(content:'What a sharp dresser!', memorialized_user_id: collin.id)


collin.memories.create(content:'Love this guy!', memorialized_user_id: abraham.id)
collin.memories.create(content:'Sunnyside fo evah!', memorialized_user_id: ed.id)

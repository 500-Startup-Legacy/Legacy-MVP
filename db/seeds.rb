User.delete_all
Relationship.delete_all
Memory.delete_all

collin = User.create(first_name:'Collin', last_name: 'Meyers', email:'cfmeyers@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'7038287113')
sora = User.create(first_name:'Sora', last_name: 'Kim', email:'sorajkim@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'2022701115')
ed = User.create(first_name:'Ed', last_name: 'Brooks', email:'edbrooks214@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'9178227288')
abraham = User.create(first_name:'Abraham', last_name: 'Lincoln', email:'abe@gmail.com', password: 'foobar', password_confirmation: 'foobar', public:true, phone_number: '2222222222')

alex = User.create(first_name:'alex', last_name: 'wang', email:'alexwang949@gmail.com', password: 'foobar', password_confirmation: 'foobar', public:true, phone_number:'7038287112')
alex1 = User.create(first_name:'alex1', last_name: 'wang', email:'alexwang9499@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'7038287111')
alex2 = User.create(first_name:'alex2', last_name: 'wang', email:'alexwang94999@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'7038287110')
alex3 = User.create(first_name:'alex3', last_name: 'wang', email:'alexwang949999@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'7038287114')
alex4 = User.create(first_name:'alex4', last_name: 'wang', email:'alexwang94999969@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'7038287115')
alex5 = User.create(first_name:'alex5', last_name: 'wang', email:'alexwang941999999@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'7038287116')
alex6 = User.create(first_name:'alex6', last_name: 'wang', email:'alexwang94912399999@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'7038287117')
alex7 = User.create(first_name:'alex7', last_name: 'wang', email:'alexwang94991239999@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'7038287118')
alex8 = User.create(first_name:'alex8', last_name: 'wang', email:'alexwang9499239999@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'7038287119')
alex9 = User.create(first_name:'alex9', last_name: 'wang', email:'alexwang949994999@gmail.com', password: 'foobar', password_confirmation: 'foobar', phone_number:'7038287103')
alex10 = User.create(first_name:'alex10', last_name: 'wang', email:'alexwang9491399999@gmail.com', password: 'foobar', password_confirmation: 'foobar', public:true, phone_number:'7038287123')
alex11 = User.create(first_name:'alex11', last_name: 'wang', email:'alexwang949919999@gmail.com', password: 'foobar', password_confirmation: 'foobar', public:true, phone_number:'7038287133')
alex12 = User.create(first_name:'alex12', last_name: 'wang', email:'alexwang9499923999@gmail.com', password: 'foobar', password_confirmation: 'foobar', public:true, phone_number:'7038287143')



collin.memorialize!(abraham, "friend")
collin.memorialize!(ed, "family")
ed.memorialize!(abraham, "coworker")
ed.memorialize!(collin, "family")
sora.memorialize!(collin, "family")

sora.memories.create(content:'What a sharp dresser!', memorialized_user_id: collin.id)
alex.memorialize!(collin, "friend")
alex.memorialize!(abraham, "family")
alex.memorialize!(alex1, "coworker")
alex.memorialize!(alex2, "family")
alex.memorialize!(alex3, "friend")
alex.memorialize!(alex4, "coworker")
alex.memorialize!(alex5, "family")
alex.memorialize!(alex6, "friend")
alex.memorialize!(alex7, "coworker")
alex.memorialize!(alex8, "family")
alex.memorialize!(alex9, "friend")
alex.memorialize!(alex10, "coworker")
alex.memorialize!(alex11, "family")
alex.memorialize!(alex12, "friend")
alex.memorialize!(sora, "coworker")
alex.memorialize!(ed, "friend")



ed.memories.create(content:'He was our greatest president.', memorialized_user_id: abraham.id)
ed.memories.create(content:'What a sharp dresser!', memorialized_user_id: collin.id)

collin.memories.create(content:'Love this guy!', memorialized_user_id: abraham.id)
collin.memories.create(content:'Sunnyside fo evah!', memorialized_user_id: ed.id)

alex.memories.create(content:'Love this guy!Love this guy!Love this guy!', memorialized_user_id: abraham.id, image_url: 'https://placeimg.com/339/191/any')
alex.memories.create(content:'Love this guy!Love this guy!LovLove tLove this guy!his guy!e this guy!', memorialized_user_id: ed.id, image_url: 'https://placeimg.com/339/191/any')
alex.memories.create(content:'He was a badass mofoLovLove this guy!e this guy!', memorialized_user_id: collin.id, image_url: 'https://placeimg.com/339/191/any')
alex.memories.create(content:'Glad he"s deLove thisLove this guy! guy!ad!', memorialized_user_id: alex1.id, image_url: 'https://placeimg.com/339/191/any')
alex.memories.create(content:'Love this gLove tLove thLove this guy!is guy!his guy!uy!', memorialized_user_id: alex2.id, image_url: 'https://placeimg.com/339/191/any')
alex.memories.create(content:'He owes me moLove thiLove this guy!s guy!ney', memorialized_user_id: alex3.id, image_url: 'https://placeimg.com/339/191/any')
alex.memories.create(content:'GlLove this guy!adLove this guy! he"s dead!', memorialized_user_id: alex4.id)
alex.memories.create(content:'Love tLove this gLove this guy!uy!his guy!', memorialized_user_id: alex5.id)
alex.memories.create(content:'He oweLove this gLove this guy!uy!s me money', memorialized_user_id: ed.id)
alex.memories.create(content:'Glad he"s dead!', memorialized_user_id: ed.id)
alex.memories.create(content:'Love this guy!', memorialized_user_id: alex3.id)
alex.memories.create(content:'He owes me money', memorialized_user_id: alex7.id)

alex.memories.create(content:'He owes me money', memorialized_user_id: alex6.id)
alex.memories.create(content:'Love this guy!', memorialized_user_id: alex4.id)

alex.memories.create(content:'Love this guy!', memorialized_user_id: alex12.id)
alex.memories.create(content:'He owes me money', memorialized_user_id: alex11.id)
alex.memories.create(content:'Glad he"s dead!', memorialized_user_id: alex10.id)
alex.memories.create(content:'Love this guy!', memorialized_user_id: alex9.id)
alex.memories.create(content:'He owes me money', memorialized_user_id: alex8.id)

alex.memories.create(content:'He owes me money', memorialized_user_id: alex2.id)
alex.memories.create(content:'Love this guy!', memorialized_user_id: alex4.id)


abraham.memories.create(content:'Love this guy!', memorialized_user_id: collin.id)
abraham.memories.create(content:'Wil always remember Collin cuz he da bomb', memorialized_user_id: collin.id)
abraham.memories.create(content:"Don't think I forgot about all that money you owe me", memorialized_user_id: collin.id)

abraham.memories.create(content:"Ed, Collin shouldn't be able to see this memory.", memorialized_user_id: ed.id)

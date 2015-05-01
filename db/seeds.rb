User.delete_all
Subject.delete_all
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



sora_collin = sora.subjects.create(email:collin.email, group_tag:"family", name: collin.full_name)
sora_collin.memories.create(content:'What a sharp dresser!')


alex_alex1 = alex.subjects.create(email:alex1.email,   name: alex1.full_name, group_tag:"coworker")
alex_alex1.memories.create(content:'Glad he"s deLove thisLove this guy! guy!ad!', image_url: 'https://placeimg.com/339/191/any')

alex_collin =alex.subjects.create(email:collin.email,  name: collin.full_name, group_tag:"coworker")
alex_collin.memories.create(content:'He was a badass mofoLovLove this guy!e this guy!', image_url: 'https://placeimg.com/339/191/any')

alex_abraham=alex.subjects.create(email:abraham.email, name: abraham.full_name, group_tag:"coworker")

alex_ed =    alex.subjects.create(email:ed.email,      name: ed.full_name, group_tag:"coworker")
alex_ed.memories.create(content:'Glad he"s dead!')

alex_alex2 = alex.subjects.create(email:alex2.email,   name: alex2.full_name, group_tag:"coworker")
alex_alex3 = alex.subjects.create(email:alex3.email,   name: alex3.full_name, group_tag:"family")
alex_alex4 = alex.subjects.create(email:alex4.email,   name: alex4.full_name, group_tag:"coworker")
alex_alex5 = alex.subjects.create(email:alex5.email,   name: alex5.full_name, group_tag:"coworker")
alex_alex6 = alex.subjects.create(email:alex6.email,   name: alex6.full_name, group_tag:"friend")
alex_alex7 = alex.subjects.create(email:alex7.email,   name: alex7.full_name, group_tag:"coworker")
alex_alex8 = alex.subjects.create(email:alex8.email,   name: alex8.full_name, group_tag:"coworker")
alex_alex9 = alex.subjects.create(email:alex9.email,   name: alex9.full_name, group_tag:"family")
alex_alex10= alex.subjects.create(email:alex10.email,  name: alex10.full_name, group_tag:"coworker")
alex_alex11= alex.subjects.create(email:alex11.email,  name: alex11.full_name, group_tag:"family")
alex_alex12= alex.subjects.create(email:alex12.email,  name: alex12.full_name, group_tag:"family")


alex_alex2.memories.create(content:'He owes me money')
alex_alex3.memories.create(content:'Love this guy!')
alex_alex4.memories.create(content:'Love this guy!')
alex_alex5.memories.create(content:'Love tLove this gLove this guy!uy!his guy!')
alex_alex6.memories.create(content:'He owes me money')
alex_alex7.memories.create(content:'He owes me money')
alex_alex8.memories.create(content:'He owes me money')
alex_alex9.memories.create(content:'Love this guy!')
alex_alex10.memories.create(content:'Glad he"s dead!')
alex_alex11.memories.create(content:'He owes me money')
alex_alex12.memories.create(content:'Love this guy!')


ed_abraham = ed.subjects.create(email:abraham.email, group_tag:"friend", name: abraham.full_name)
ed_abraham.memories.create(content:'He was our greatest president.')

ed_collin = ed.subjects.create(email:collin.email, group_tag:"family", name: collin.full_name)
ed_collin.memories.create(content:'What a sharp dresser!')

collin_abraham = collin.subjects.create(email:abraham.email, group_tag:"friend", name: abraham.full_name)
collin_abraham.memories.create(content:'Love this guy!')

collin_ed = collin.subjects.create(email:ed.email, group_tag:"family", name: ed.full_name)
collin_ed.memories.create(content:'Sunnyside fo evah!')




abraham_collin = abraham.subjects.create(email:collin.email, group_tag:"friend", name: collin.full_name)
abraham_ed = abraham.subjects.create(email:ed.email, group_tag:"friend", name: ed.full_name)
abraham_ed.memories.create(content:"Ed, Collin shouldn't be able to see this memory.")
abraham_collin.memories.create(content:'Love this guy!')
abraham_collin.memories.create(content:'Wil always remember Collin cuz he da bomb')
abraham_collin.memories.create(content:"Don't think I forgot about all that money you owe me")
abraham_collin.memories.create(content:"Don't think I forgot about all that money you owe me")


user = User.create(username: "PaulMall", first_name: "Paul", last_name: "clegg", email: "paul@paul.com", password: "password", phone: "773-355-1422")
address1 = Address.create(street: "1462 W Carmen Ave Apt 2", city: "Chicago", state: "IL", zip_code: "60640")
address2 = Address.create(street: "4950 N Marine Dr Apt 103", city: "Chicago", state: "IL", zip_code: "60640")
property_manager = PropertyManager.create(name: "tom", phone: "773-606-6186", email: "tom@tom.com", address: address1)
house = user.houses.create(name: "The Hater House", house_key: "igeekallweek", address: address2, property_manager_id: property_manager.id)
rule = Rule.create(content: "Flush the toilet", house_id: 1)
rule2 = Rule.create(content: "Shower daily", house_id: 1)
chore = Chore.create(task: "Do the dishes", house_id: 1)
user.chores.create(task: "Mop the floor", house_id: 1)
event = Event.create(name: "Halloween Party", date: "2013-09-12 22:49:27", description: "Costume party!!", house_id: 1)
communal_item = CommunalItem.create(name: "toilet paper", brand: "charmin", quantity: 12, house_id: 1, stock_level: "low")
message = Message.create(content: "You're the best!!", house_id: 1, author_id: 1)
chore_issue = chore.issues.create(reason: "I HATE PAUL!!", user_id: 1)
item_issue = communal_item.issues.create(reason: "I hate paper towel", user_id: 1)
event_issue = event.issues.create(reason: "I hate halloween", user_id: 1)
rule_issue = rule.issues.create(reason: "I hate flushing!!", user_id: 1)
chore_promise_true = chore.user_promises.create(user_id: 1, fulfilled: true)
chore_promise_false = chore.user_promises.create(user_id: 1)
communal_item.user_promises.create(user_id: 1)
communal_item.user_promises.create(user_id: 1, fulfilled: true)

chore2 = Chore.create(task: "Take out trash if it smells", house_id: 1)
chore3 = Chore.create(task: "Wash your face", house_id: 1)
chore4 = Chore.create(task: "Get out of my face", house_id: 1)
chore5 = Chore.create(task: "Say hello like a fucking normal person", house_id: 1)

message2 = Message.create(content: "Love you!!!", house_id: 1, author_id: 1)
message3 = Message.create(content: "OMFG, You guys suck!", house_id: 1, author_id: 1)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Profile.destroy_all
User.destroy_all
TodoItem.destroy_all
TodoList.destroy_all

User.create! [
   {username: "Fiorina", password_digest: "abc"},
   {username: "Trump", password_digest: "123"},
   {username: "Carson", password_digest: "456"},
   {username: "Clinton", password_digest: "def"}
]

Profile.create! [
   {first_name: "Carly", last_name: "Fiorina", birth_year: 1954, gender: "female"},
   {first_name: "Donald", last_name: "Trump", birth_year: 1946, gender: "male"},
   {first_name: "Ben", last_name: "Carson", birth_year: 1951, gender: "male"},
   {first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female"}
]

User.all.to_a.each do |user|
   Profile.find_by(last_name: user.username).update(user_id: user.id)
end

for i in 1..20 do
   TodoItem.create! [
      {title: "Item #{i}", description: "Description of item #{i}", due_date: Date.today + 1.year}
   ]
end

for i in 1..4 do
   todo_list = TodoList.create! [
      {list_name: "List #{i}", list_due_date: Date.today + 1.year}
   ]
   TodoItem.all.limit(5).offset(4).each.to_a do |item| 
      item.update(todo_list_id: todo_list.id)
   end

end

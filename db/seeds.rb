# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 #Users

User.create!([
  {email: "1234@localhost", password: "some_password", frequency: "Weekly", reminder_day_of_week: "Monday" , age: 22, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-12-31 22:27:09", last_sign_in_at: "2014-12-31 22:27:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])

User.create!([
  {email: "kyle@betterment.com", password: "some_pasasdfadsfsword", frequency: "Monthly", reminder_day_of_week: "Sunday" , age: 22, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-12-31 22:27:09", last_sign_in_at: "2014-12-31 22:27:09", current_sign_in_ip: "122.0.0.1", last_sign_in_ip: "137.0.0.1"}
])

User.create!([
  {email: "trevor@betterment.com", password: "some_asdfpasasdfvzdsdfadsfsword", frequency: "Twice a week", reminder_day_of_week: "Monday" , age: 45, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-12-31 22:27:09", last_sign_in_at: "2014-11-31 22:27:09", current_sign_in_ip: "121.0.0.1", last_sign_in_ip: "127.0.0.1"}
])



jot = Jot.new
jot.title = "A big change in my life"
jot.body = "Today was insane, I can't believe what happened"
jot.user_id = 1
jot.jewel_id = 1
jot.save!

jot_two = Jot.new
jot_two.title = "A big change in my life"
jot_two.body = "It was one of the best days in my career"
jot_two.user_id = 2
jot_two.jewel_id = 2
jot_two.save!

jewel = Jewel.new
jewel.jot_id = 1
jewel.body = "The best men, don't care what others think."
jewel.save!

jewel_two = Jewel.new
jewel_two.jot_id = 2
jewel_two.body = "Don't care about anything"
jewel_two.save!

jewel_three = Jewel.new
jewel_three.jot_id = 3
jewel_three.body = "You have to believe in yourself"
jewel_three.save!










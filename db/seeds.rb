# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!(
  full_name: 'Test User',
  email: 'testuser@example.com',
  password: 'password',
  password_confirmation: 'password'
)
Todo.create([
              { title: 'First Task', description: 'This is the first task', due_date: Date.today + 1, priority: 1, completed: false, user: user },
              { title: 'Second Task', description: 'This is the second task', due_date: Date.today + 2, priority: 2, completed: false, user: user },
              { title: 'Third Task', description: 'This is the third task', due_date: Date.today + 3, priority: 3, completed: false, user: user },
            ])

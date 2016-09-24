Department.delete_all
Employee.delete_all
Goal.delete_all

department = Department.create!(name: 'Safety')
department.goals.create!(description: 'No nuclear explosions')
department.employees.create!(name: 'Homer Simpson', age: 38)

department = Department.create!(name: 'Management')
department.goals.create!(description: 'Rule the world')
department.employees.create!(name: 'Mr. Burns', age: 82)

department = Department.create!(name: 'Henchmen')
department.goals.create!(description: 'Serve and obey')
department.employees.create!(name: 'Smithers', age: 40)

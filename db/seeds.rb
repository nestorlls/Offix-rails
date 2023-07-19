puts "Seedin database"

puts "destroying data"
Department.destroy_all
Employee.destroy_all

puts "Seedin start"
marketing = Department.create(name:"Marketing", description: "Marketing department")
employee1 = Employee.create(name: 'Paul', nationality: 'Peru', role: 'CEO', birth_date: '2000-01-01', department: marketing)
employee2= Employee.create(name: 'Lila', nationality: 'Peru', role: 'CEO', birth_date: '2000-01-01', department: marketing)
puts "Seedin end"
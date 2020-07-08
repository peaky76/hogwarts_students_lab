require('pry-byebug')
require_relative('../models/student')

Student.delete_all()

student1 = Student.new({
    "first_name" => "Jane",
    "second_name" => "Hope",
    "house" => "Gryffindor",
    "age" => 25
})

student2 = Student.new({
    "first_name" => "Robert",
    "second_name" => "Peacock",
    "house" => "Ravenclaw",
    "age" => 43
})

student3 = Student.new({
    "first_name" => "Alina",
    "second_name" => "Linden",
    "house" => "Hufflepuff",
    "age" => 32
})

student1.save()
student2.save()
student3.save()

binding.pry
nil
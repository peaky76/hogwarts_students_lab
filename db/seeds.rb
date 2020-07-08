require('pry-byebug')
require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()
House.delete_all()

house1 = House.new({
    "name" => "Gryffindor",
    "logo_url" => "https://1.bp.blogspot.com/-WV_sb7UjMIo/V_ENTue9HCI/AAAAAAABCrA/XocZ5xwp9mo7DSoaB-qXU_AxLKC7e2DbgCEw/s320/gryffindor.jpg"
})

house2 = House.new({
    "name" => "Slytherin",
    "logo_url" => "https://1.bp.blogspot.com/-nQCYFpQIJQQ/V_ENVM7G_ZI/AAAAAAABCrI/5FfjP0hh6skEKKbGP5yhd17gqrkeYymUQCEw/s320/slytherin.jpg"
})

house3 = House.new({
    "name" => "Ravenclaw",
    "logo_url" => "https://4.bp.blogspot.com/-FfxqfrKt9UA/V_ENUpNkHuI/AAAAAAABCrE/a16s6N7zEBIsWl8-QAw5oQk9AMMcYFr2gCEw/s320/ravenclaw.jpg"
})

house4 = House.new({
    "name" => "Hufflepuff",
    "logo_url" => "https://2.bp.blogspot.com/-UcA_FGXVBHQ/V_EN4vkmPFI/AAAAAAABCrM/LjhvcqfOo841_NmuelBqFW40dz7zxG9QQCLcB/s320/hufflepuff.jpg"
})

houses = [house1, house2, house3, house4]
houses.each { |house| house.save() }

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

students = [student1, student2, student3]
students.each { |student| student.save() }

binding.pry
nil
require_relative('../db/sql_runner')

class Student

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @second_name
        @house
        @age
    end

end
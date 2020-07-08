require_relative('../db/sql_runner')

class Student

    attr_reader :first_name, :second_name, :house_id, :age, :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @second_name = options['second_name']
        @house_id = options['house_id'].to_i
        @age = options['age']
    end

    def house()
        sql = "SELECT * FROM houses
        WHERE id = $1"
        values = [@house_id]
        house_data = SqlRunner.run(sql, values).first
        return House.new(house_data)
    end

    def pretty_name()
        return "#{@first_name} #{@second_name}"
    end

    def save()
        sql = "INSERT INTO students
        (first_name, second_name, house_id, age)
        VALUES ($1, $2, $3, $4)
        RETURNING id"
        values = [@first_name, @second_name, @house_id, @age]
        result = SqlRunner.run(sql, values).first
        @id = result['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM students"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM students"
        student_data = SqlRunner.run(sql)
        return student_data.map { |student| Student.new(student) }
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM students
        WHERE id = $1"
        values = [id]
        student_data = SqlRunner.run(sql, values).first
        return Student.new(student_data)
    end

end
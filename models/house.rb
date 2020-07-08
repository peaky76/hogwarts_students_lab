require_relative('../db/sql_runner')

class House

    attr_reader :name, :logo_url, :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @logo_url = options['logo_url']
    end

    def save()
        sql = "INSERT INTO houses
        (name, logo_url)
        VALUES ($1, $2)
        RETURNING id"
        values = [@name, @logo_url]
        result = SqlRunner.run(sql, values).first
        @id = result['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM houses"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM houses"
        house_data = SqlRunner.run(sql)
        return house_data.map { |house| House.new(house) }
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM houses
        WHERE id = $1"
        values = [id]
        house_data = SqlRunner.run(sql, values).first
        return House.new(house_data)
    end



end
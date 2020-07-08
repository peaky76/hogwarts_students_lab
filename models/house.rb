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

end
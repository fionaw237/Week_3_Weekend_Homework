require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
           VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2)
           WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

end

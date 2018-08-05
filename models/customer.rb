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

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
           INNER JOIN tickets ON films.id = tickets.film_id
           WHERE tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map {|film| Film.new(film)}
  end

  def tickets()
    sql = "SELECT tickets.* FROM tickets WHERE tickets.customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map {|ticket| Ticket.new(ticket)}
  end

end

require_relative("../db/sql_runner")

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
  end

end

require_relative("models/customer")
require_relative("models/film")
require_relative("models/ticket")

require("pry-byebug")

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new(
  {
    'name' => 'Fiona Wilson',
    'funds' => 20
  }
)

customer2 = Customer.new(
  {
    'name' => 'Joanna Wilson',
    'funds' => 25
  }
)

customer1.save()
customer2.save()

film1 = Film.new(
  {
    'title' => 'The Fellowship of the Ring',
    'price' => 8
  }
  )

film2 = Film.new(
  {
    'title' => 'The Two Towers',
    'price' => 9
  }
)

film1.save()
film2.save()

ticket1 = Ticket.new(
  {
    'customer_id' => customer1.id,
    'film_id' => film1.id
  }
)

ticket1.save()
customer1.buy_ticket(film1.id)

ticket2 = Ticket.new(
  {
    'customer_id' => customer2.id,
    'film_id' => film1.id
  }
)

ticket2.save()
customer2.buy_ticket(film1.id)

ticket3 = Ticket.new(
  {
    'customer_id' => customer1.id,
    'film_id' => film2.id
  }
)

ticket3.save()
customer1.buy_ticket(film2.id)

# ticket4 = Ticket.new(
#   {
#     'customer_id' => customer2.id,
#     'film_id' => film2.id
#   }
#)




binding.pry
nil

class Checkout
  attr_accessor(:id, :due_date, :patron_id, :book_id)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @due_date = attributes.fetch(:due_date)
    @patron_id = attributes.fetch(:patron_id)
    @book_id = attributes.fetch(:book_id)
  end

end    

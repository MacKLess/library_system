class Patron
  attr_accessor(:id, :name)

  def initalize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end


end    

class Patron
  attr_accessor(:id, :name)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    patron_list = DB.exec("SELECT * FROM patrons;")
    patrons = []
    patron_list.each do |patron|
      name = patron.fetch('name')
      id = patron.fetch('id').to_i
      patrons.push(Patron.new({:name => name, :id => id}))
    end
    patrons
  end

  def ==(another_patron)
    self.name().==(another_patron.name()).&(self.id().==(another_patron.id()))
  end

  def save
    patron = DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING id;")
    @id = patron.first.fetch('id').to_i
  end
end

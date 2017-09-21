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

  def update(attributes)
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE patrons SET name = '#{@name}' WHERE id = #{self.id};")

    attributes.fetch(:book_ids, []).each do |book_id|
      DB.exec("INSERT INTO books_patrons (book_id, patron_id) VALUES (#{book_id}, #{self.id});")
    end
  end

  def books
    patron_books = []
    results = DB.exec("SELECT book_id FROM books_patrons WHERE patron_id = #{self.id};")
    results.each do |result|
      book_id = result.fetch("book_id").to_i
      book = DB.exec("SELECT * FROM books WHERE id = #{book_id};")
      title = book.first.fetch("title")
      author = book.first.fetch("author")
      patron_books.push(Book.new({:title => title, :author => author, :id => book_id}))
    end
    patron_books
  end

  def delete
    DB.exec("DELETE FROM books_patrons WHERE patron_id = #{self.id};")
    DB.exec("DELETE FROM patrons WHERE id = #{self.id};")
  end
end

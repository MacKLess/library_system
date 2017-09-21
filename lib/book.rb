class Book
  attr_accessor(:title, :author, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @id = attributes.fetch(:id)
  end

  def self.all
    books_list = DB.exec("SELECT * FROM books;")
    books = []
    books_list.each do |book|
      title = book.fetch("title")
      author = book.fetch("author")
      id = book.fetch("id").to_i
      books.push(Book.new({:title => title, :author => author, :id => id}))
    end
    books
  end

  def save
    result = DB.exec("INSERT INTO books (title, author) VALUES ('#{@title}', '#{@author}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def ==(another_book)
    self.title().==(another_book.title()).&(self.author().==(another_book.author()))
  end

  def delete
    DB.exec("DELETE FROM books_patrons WHERE book_id = #{self.id};")
    DB.exec("DELETE FROM books WHERE id = #{self.id};")
  end

  def self.find_title(title)
    Book.all.each do |book|
      if book.title == title
        return book
      end
    end
  end

  def self.find_author(author)
    Book.all.each do |book|
      if book.author == author
        return book
      end
    end
  end

  def self.find_id(id)
    Book.all.each do |book|
      if book.id == id
        return id
      end
    end
  end  

  def update(attributes)
    @title = attributes.fetch(:title, @title)
    DB.exec("UPDATE books SET title = '#{@title}' WHERE id = #{self.id};")

    attributes.fetch(:patron_ids, []).each do |patron_id|
      DB.exec("INSERT INTO books_patrons (book_id, patron_id) VALUES (#{self.id}, #{patron_id});")
    end
  end

  def patrons
    book_patrons = []
    results = DB.exec("SELECT patron_id FROM books_patrons WHERE book_id = #{self.id};")
    results.each do |result|
      patron_id = result.fetch("patron_id").to_i
      patron = DB.exec("SELECT * FROM patrons WHERE id = #{patron_id};")
      name = patron.first.fetch("name")
      book_patrons.push(Patron.new({:name => name, :id => patron_id}))
    end
    book_patrons
  end
end

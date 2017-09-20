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
      id = book.fetch("id").to_i
      author = books.fetch("author")
      books.push(Book.new({:title => title, :id => id, :author => author}))
    end
    books
  end




    
end

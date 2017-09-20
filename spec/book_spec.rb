require('spec_helper')

describe(Book) do
  describe ('#initialize') do
    it("will create an instance of the book class") do
      book = Book.new({:title => "Innerstellar Pig", :author => "William Sleator", :id => nil})
      expect(book.title).to(eq("Innerstellar Pig"))
    end
  end

  describe('.all') do
    it("will return a list of all the books from the database") do
      expect(Book.all).to(eq([]))
    end
  end

  describe('#save') do
    it("will save an instance of the book to the database.") do
      book = Book.new({:title => "Innerstellar Pig", :author => "William Sleator", :id => nil})
      book.save
      expect(Book.all()).to(eq([book]))
    end
  end

  describe('#==') do
    it("is the same book if it has the same title and author") do
      book1 = Book.new({:title => "Innerstellar Pig", :author => "William Sleator", :id => nil})
      book2 = Book.new({:title => "Innerstellar Pig", :author => "William Sleator", :id => nil})
      expect(book1).to(eq(book2))
    end
  end


end

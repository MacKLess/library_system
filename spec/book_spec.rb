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

  # describe('#save') do
  #   it("will save an instance of the book to the database.") do
  #     book.save
  #     expect()
  #   end
  # end

end

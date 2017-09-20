require('spec_helper')

describe(Book) do
  describe ('#initialize') do
    it("will create an instance of the book class") do
      book = Book.new({:title => "Innerstellar Pig", :author => "William Sleator", :id => nil})
      expect(book.title).to(eq("Innerstellar Pig"))
    end
  end

end

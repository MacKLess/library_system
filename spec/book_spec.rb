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

  describe('#delete') do
    it('will delete a book from the database') do
      book = Book.new({:title => "Innerstellar Pig", :author => "William Sleater", :id => nil})
      book.save
      book.delete
      expect(Book.all).to(eq([]))
    end
  end

  describe('.find_title') do
    it ('will return a book when given a title') do
      book1 = Book.new({:title => "Innerstellar Pig", :author => "William Sleator", :id => nil})
      book2 = Book.new({:title => "The Hobbit", :author => "J.R.R. Tolkien", :id => nil})
      book1.save
      book2.save
      expect(Book.find_title("Innerstellar Pig")).to(eq(book1))
    end
  end

  describe('.find_author') do
    it('will return a book when given an author') do
      book1 = Book.new({:title => "Innerstellar Pig", :author => "William Sleator", :id => nil})
      book2 = Book.new({:title => "The Hobbit", :author => "J.R.R. Tolkien", :id => nil})
      book1.save
      book2.save
      expect(Book.find_author("J.R.R. Tolkien")).to(eq(book2))
    end
  end

  describe('#update') do
    it('lets you add a patron to a book') do
      patron = Patron.new({:name => "Cruella deVille", :id => nil})
      patron.save
      book = Book.new({:title => "The Poky Little Puppy", :author => "Janette Sebring Lowrey", :id => nil})
      book.save
      book.update({:patron_ids => [patron.id]})
      expect(book.patrons).to(eq([patron]))
    end
  end

  describe('#patrons') do
    it('returns all patrons that have checked out a particular book') do
      patron = Patron.new({:name => "Emily Dickinson", :id => nil})
      patron.save
      patron2 = Patron.new({:name => "Pablo Nuerda", :id => nil})
      patron2.save
      book = Book.new({:title => "Outsiders", :author => "S.E. Hinton", :id => nil})
      book.save
      book.update({:patron_ids => [patron.id]})
      book.update({:patron_ids => [patron2.id]})
      expect(book.patrons).to(eq([patron, patron2]))
    end
  end

end

require('spec_helper')

describe(Patron) do
  describe('#initialize') do
    it("will create an instance of a patron") do
      patron = Patron.new({:name => "Tom Jones", :id => nil})
      expect(patron.name).to(eq("Tom Jones"))
    end
  end

  describe('.all') do
    it("will return a list of patrons from the database") do
      expect(Patron.all).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same patron if the name and id are the same') do
      patron1 = Patron.new({:name => "Tom Jones", :id => nil})
      patron2 = Patron.new({:name => "Tom Jones", :id => nil})
      expect(patron1).to(eq(patron2))
    end
  end

  describe('#save') do
    it('will save a new patron in the database') do
      patron = Patron.new({:name => "Tom Jones", :id => nil})
      patron.save
      expect(Patron.all).to(eq([patron]))
    end
  end

  describe('#update') do
    it('will update patron instances in the database') do
      patron = Patron.new({:name => "Tom Jones", :id => nil})
      patron.save
      patron.update({:name => "Tom Megatron Jones"})
      patron.save
      expect(patron.name).to(eq("Tom Megatron Jones"))
    end

    it('lets you add a book to a patron') do
      patron = Patron.new({:name => "Tom Jones", :id => nil})
      patron.save
      hobbit = Book.new({:title => "The Hobbit", :author => "J.R.R. Tolkien", :id => nil})
      hobbit.save
      silmarillion = Book.new({:title => "The Silmarillion", :author => "J.R.R. Tolkien", :id => nil})
      silmarillion.save
      patron.update({:book_ids => [hobbit.id, silmarillion.id]})
      expect(patron.books).to(eq([hobbit, silmarillion]))
    end
  end

  describe('#books') do
    it('returns all of the books in a particular patron record') do
      patron = Patron.new({:name => "Nancy Drew", :id => nil})
      patron.save
      persuasion = Book.new({:title => "Persuasion", :author => "Jane Austen", :id => nil})
      persuasion.save
      wuthering = Book.new({:title => "Wuthering Heights", :author => "Emily Bronte", :id => nil})
      wuthering.save
      patron.update({:book_ids => [persuasion.id, wuthering.id]})
      expect(patron.books).to(eq([persuasion, wuthering]))
    end
  end

  describe('#delete') do
    it('will delete a patron form the database') do
    patron = Patron.new({:name => "Tom Jones", :id => nil})
    patron.save
    patron.delete
    expect(Patron.all).to(eq([]))
    end
  end


end

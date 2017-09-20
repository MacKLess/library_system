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
    it('is the same patron if the name is the same') do
      patron1 = Patron.new({:name => "Tom Jones", :id => nil})
      patron2 = Patron.new({:name => "Tom Jones", :id => nil})
      expect(patron1).to(eq(patron2))
    end
  end


end

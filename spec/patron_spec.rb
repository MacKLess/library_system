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

  
end

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

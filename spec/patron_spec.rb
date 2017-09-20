require('spec_helper')

describe(Patron) do
  describe('#initialize') do
    it("will create an instance of a patron") do
      patron = Patron.new({:name => "Tom Jones", :id => nil})
      expect(patron.name).to(eq("Tom Jones"))
    end
  end
end

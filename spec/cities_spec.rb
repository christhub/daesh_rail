require('spec_helper')

describe('Cities') do
  describe('#id') do
    it('returns an id') do
      new_city = Cities.new({:name => "Aleppo", :id => 1})
        expect(new_city.id).to(eq(1))
    end
  end
  describe('#name') do
    it('returns an name') do
      new_city = Cities.new({:name => "Aleppo", :id => 1})
        expect(new_city.name).to(eq("Aleppo"))
    end
  end
end

require('spec_helper')

describe('Cities') do
  before do
    @new_city = Cities.new({:name => "Aleppo", :id => 1})
  end
  describe('#id') do
    it('returns an id') do
      expect(@new_city.id).to(eq(1))
    end
  end
  describe('#name') do
    it('returns an name') do
      expect(@new_city.name).to(eq("Aleppo"))
    end
  end
  describe('.all') do
    it('returns an empty array') do
      expect(Cities.all).to(eq([]))
    end
  end
  describe('#save') do
    it('saves a city to the cities database') do
      @new_city.save
      expect(Cities.all).to(eq([@new_city]))
    end
  end
  describe('#==') do
    it('returns true when the attributes are the same') do
      new_city_1 = Cities.new({:name => "Aleppo", :id => 1})
      new_city_one = Cities.new({:name => "Aleppo", :id => 1})
      expect(new_city_1).to(eq(new_city_1))
    end
  end
end

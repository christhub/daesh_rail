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
end

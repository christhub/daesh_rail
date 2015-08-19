require('spec_helper')

describe(Stop) do

   before do
     @new_stop = Stop.new(:train_id => 1, :city_id => 1, :id => 1, :time => "12:00")
   end

  describe('#id') do
    it('will return the id') do
      expect(@new_stop.id).to(eq(1))
    end
  end

  describe('#train_id') do
    it('will return the train id') do
      expect(@new_stop.train_id).to(eq(1))
    end
  end

  describe('#city_id') do
    it('will return the city id') do
      expect(@new_stop.city_id).to(eq(1))
    end
  end

  describe('#time') do
    it('will return the stored time variable') do
      expect(@new_stop.time).to(eq("12:00"))
    end
  end

  describe('.all') do
    it('will initiate an empty array') do
      expect(Stop.all).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the object into the database') do
      @new_stop.save
      expect(Stop.all).to(eq([@new_stop]))
    end
  end

  describe('#==') do
    it("will compare two objects and see if they're the same") do
      stop1 = Stop.new(:train_id => 1, :city_id => 1, :id => 1, :time => "12:00")
      stop2 = Stop.new(:train_id => 1, :city_id => 1, :id => 1, :time => "12:00")
      expect(stop1).to(eq(stop2))
    end
  end

  describe('.find') do
    it("will find the stop given its identifier") do
      @new_stop.save
      expect(Stop.find(1)).to(eq(@new_stop))
    end
  end

end

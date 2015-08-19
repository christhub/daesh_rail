require('spec_helper')

describe(Train) do

   before do
     @new_train = Train.new(:name => "abu bakr al-baghdadhi", :id => 1)
   end

  describe('#id') do
    it('will return the id') do
      expect(@new_train.id).to(eq(1))
    end
  end

  describe('#name') do
    it('will return the name') do
      expect(@new_train.name).to(eq("abu bakr al-baghdadhi"))
    end
  end

  describe('.all') do
    it('will initiate an empty array') do
      expect(Train.all).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the object into the database') do
      @new_train.save
      expect(Train.all).to(eq([@new_train]))
    end
  end

  describe('#==') do
    it("will compare two objects and see if they're the same") do
      train1 = Train.new(:name => "abu bakr al-baghdadhi", :id => 1)
      train2 = Train.new(:name => "abu bakr al-baghdadhi", :id => 1)
      expect(train1).to(eq(train2))
    end
  end

  describe('.find') do
    it("will find the train given its identifier") do
      @new_train.save
      expect(Train.find(1)).to(eq(@new_train))
    end
  end

end

require('spec_helper')

describe(Train) do

   before do
     @new_train = Train.new(:name => "abu-bawr al-bagdadhi", :id => 1)
   end

  describe('#id') do
    it('will return the id') do
      expect(@new_train.id).to(eq(1))
    end
  end
end

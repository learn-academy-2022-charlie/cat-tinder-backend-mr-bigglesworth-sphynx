require 'rails_helper'

RSpec.describe Dino, type: :model do
  describe 'presence' do

    it 'should validate name' do
      dino = Dino.create age:6, enjoys: 'eating', image: 'https://cdn.pixabay.com/photo/2015/07/22/11/51/tyrannosaurus-855188_960_720.jpg'

      p dino.errors[:name]
      expect(dino.errors[:name]).to_not be_empty
    end

    it 'should validate age' do

      dino = Dino.create name:'Mike', enjoys: 'eating', image: 'https://cdn.pixabay.com/photo/2015/07/22/11/51/tyrannosaurus-855188_960_720.jpg'

      expect(dino.errors[:age]).to_not be_empty

    end

    it 'should validate enjoys' do

      dino = Dino.create name:'Mike', age: 7, image: 'https://cdn.pixabay.com/photo/2015/07/22/11/51/tyrannosaurus-855188_960_720.jpg'

      expect(dino.errors[:enjoys]).to_not be_empty
      
    end

    it 'should validate image' do

      dino = Dino.create name:'Mike', age:8, enjoys: 'eating'

      expect(dino.errors[:image]).to_not be_empty
      
    end

  describe 'Minimum Length' do
    it 'will validate a minimum length of dino enjoys to 10' do
      dino = Dino.create name: 'Mike', age:6, enjoys: 'eating', image: 'https://cdn.pixabay.com/photo/2015/07/22/11/51/tyrannosaurus-855188_960_720.jpg'

      expect(dino.errors[:enjoys]).to_not be_empty
    end
  end

  end
end

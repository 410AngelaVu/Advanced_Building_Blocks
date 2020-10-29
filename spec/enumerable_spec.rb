# enumerable_spec.rb

require '../enumerable.rb'

describe Enumerable do
  describe '#my_each' do
    it 'return the same value of each method' do
      arr = [1, 2, 3, 5]
      a = []
      b = []
      arr.my_each { |x| a.push(x)}
      arr.each { |x| b.push(x)}
      expect(a).to eql(b)
    end
  end

  describe '#my_each_with_index' do
    it 'returns the item and its index' do
      hash = Hash.new
      %w[cat dog wombat].each_with_index { |item, index| hash[item] = index }
      hash1 = Hash.new
      %w[cat dog wombat].my_each_with_index { |item, index| hash1[item] = index }
      expect(hash1).to eql(hash)
    end
  end

  describe '#my_select' do
    it 'return the same value of select method' do
      arr = [1, 2, 3, 4, 5, 6]
      a = arr.my_select { |num| num % 3 == 0 }
      b = arr.select { |num| num % 3 == 0 }
      expect(a).to eql(b)
    end
    it 'return the numbers which can be divided by 3' do
      arr = [1, 2, 3, 4, 5, 6]
      a = arr.my_select { |num| num % 3 == 0 }
      expect(a).to eql([3, 6])
    end
  end
end

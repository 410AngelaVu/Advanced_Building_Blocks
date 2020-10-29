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
%w(cat dog wombat).each_with_index { |item, index|
  hash[item] = index
}
hash1 = Hash.new
%w(cat dog wombat).my_each_with_index { |item, index| hash1[item] = index}
expect(hash).to eql(hash1)
end
end
end

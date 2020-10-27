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
end

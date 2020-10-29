# enumerable_spec.rb

require '../enumerable.rb'

describe Enumerable do
  describe '#my_each' do
    let(:arr) { [1, 2, 3, 5] }
    it 'return the same value of each method' do
      a = []
      b = []
      arr.my_each { |x| a.push(x) }
      arr.each { |x| b.push(x) }
      expect(a).to eql(b)
    end
  end

  describe '#my_each_with_index' do
    let(:arr) { %w[cat dog wombat] }
    it 'returns the item and its index' do
      hash = {}
      arr.each_with_index { |item, index| hash[item] = index }
      hash1 = {}
      arr.my_each_with_index { |item, index| hash1[item] = index }
      expect(hash1).to eql(hash)
    end
  end

  describe '#my_select' do
    let(:arr) { [1, 2, 3, 4, 5, 6] }
    it 'return the same value of select method' do
      a = arr.my_select { |num| num % 3 == 0 }
      b = arr.select { |num| num % 3 == 0 }
      expect(a).to eql(b)
    end
    it 'return the numbers which can be divided by 3' do
      a = arr.my_select { |num| num % 3 == 0 }
      expect(a).to eql([3, 6])
    end
  end

  describe '#my_all?' do
    let(:arr) { ['alpha', 'apple', 'allen key'] }
    it 'return the same value of all? method' do
      a = arr.my_all? { |x| x[0] == 'a' }
      b = arr.all? { |x| x[0] == 'a' }
      expect(a).to eql(b)
    end
    it 'return true when all strings match the pattern' do
      a = arr.my_all? { |x| x[0] == 'a' }
      expect(a).to eql(true)
    end
  end

  describe '#my_any' do
    let(:arr) { ['alpha', 'apple', 'allen key'] }
    it 'return the same value of any? method' do
      a = arr.my_any? { |x| x[2] == 'l' }
      b = arr.any? { |x| x[2] == 'l' }
      expect(a).to eql(b)
    end
    it 'return true when at least one element matches the pattern' do
      a = arr.my_any? { |x| x[2] == 'l' }
      expect(a).to eql(true)
    end
  end

  describe '#my_none?' do
    let(:arr) { ['alpha', 'apple', 'allen key'] }
    it 'return the same value of none? method' do
      a = arr.my_none? { |x| x[0] == 'z' }
      b = arr.none? { |x| x[0] == 'z' }
      expect(a).to eql(b)
    end
    it 'return true when none strings match the pattern' do
      a = arr.my_none? { |x| x[0] == 'z' }
      expect(a).to eql(true)
    end
  end

  describe '#my_map' do
    let(:ran) { (1..4) }
    it 'return the same value of map method' do
      a = ran.my_map { |i| i * i }
      b = ran.map { |i| i * i }
      expect(a).to eql(b)
    end
    it 'return a new array with the results of the block' do
      a = ran.my_map { |i| i * i }
      expect(a).to eql([1, 4, 9, 16])
    end
  end

  describe '#my_inject' do
    let(:ran) { (1..4) }
    it 'return the same value of map method' do
      a = ran.my_inject { |sum, n| sum + n }
      b = ran.inject { |sum, n| sum + n }
      expect(a).to eql(b)
    end
    it 'Combines all elements of enum by applying a binary operation' do
      a = ran.my_inject { |sum, n| sum + n }
      expect(a).to eql(10)
    end
  end
end

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

module Enumerable
  def my_each
    i = 0
    while i < to_a.length
      yield to_a[i]
      i += 1
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    list = to_a if self.class == Range || Hash

    i = 0
    while i < list.length
      yield(list[i], i)
      i += 1
    end
    self
  end

  def my_select
    b = []
    to_a.my_each do |i|
      b.push i if yield i
    end
    b
  end

  def my_all?
    result = true
    if to_a.is_a?(Array)
      to_a.my_each { |item| result = false unless yield(item) }
    elsif to_a.is_a?(Hash)
      to_a.my_each { |k, v| result = false unless yield(k, v) }
    end
    result
  end

  def my_any?
    result = false
    if to_a.is_a?(Array)
      to_a.my_each { |item| result = true if yield(item) }
    elsif to_a.is_a?(Hash)
      to_a.my_each { |k, v| result = true if yield(k, v) }
    end
    result
  end

  def my_none?
    result = true
    if to_a.is_a?(Array)
      to_a.my_any? { |item| result = false if yield(item) }
    elsif to_a.is_a?(Hash)
      to_a.my_any? { |k, v| result = false if yield(k, v) }
    end
    result
  end

  def my_count(xyz = nil)
    counter = 0
    to_a.my_each { |item| counter += 1 if item == xyz || xyz.nil? }
    counter
  end

  def my_map(proc = nil)
    arr = []
    if proc.nil?
      to_a.my_each { |item| arr << yield(item) }
    else
      to_a.my_each { |item| arr << proc.call(item) }
    end
    arr
  end

  def my_inject(arg = nil, sym = nil)
    if (arg.is_a?(Symbol) || arg.is_a?(String)) && (!arg.nil? && sym.nil?)
      sym = arg
      arg = nil
    end

    if !block_given? && !sym.nil?
      my_each { |item| arg = arg.nil? ? item : arg.send(sym, item) }
    else
      my_each { |item| arg = arg.nil? ? item : yield(arg, item) }
    end
    arg
  end
end

def multiply_els(arr)
  arr.my_inject(1) { |item, total| total * item }
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity

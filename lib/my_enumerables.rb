module Enumerable
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    for i in 0..self.length-1
      yield(self[i], i)
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    result = []
    for i in 0..(self.length-1)
      if (yield(self[i]) == true)
        result << self[i]
      end
    end
    result
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?
    result = []
    my_each{|value| result.push(value) if yield(value)}
    result.length == self.length
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?
    my_each{|value| return true if yield(value)}
    return false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    result = []
    my_each{|value| result.push(value) unless yield(value)}
    result.length == self.length
  end

  def my_count
    return length unless block_given?
    result = []
    my_each{|value| result.push(value) if yield(value)}
    result.length
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    result = []
    my_each{|value| result.push(yield(value))}
    result
  end

  def my_inject(num)
    return to_enum(:my_inject) unless block_given?
    my_each{|value| num = yield(num, value)}
    num
  end
end

class Array
  def my_each
    result = []
    for i in 0..(self.length-1)
      if (yield(self[i]) == nil)
        result << self[i]
      end
    end
    result
  end 
end

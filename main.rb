module Enumerable
  def my_each
    i = 0
    while i < size
      return self[i] unless block_given?

      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index(argv = 0)
    i = 0
    return i unless argv.positive?

    i = 0 + argv
    while i < size
      return self[i], i unless block_given?

      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    i = 0
    array = []
    while i < size
      if block_given?
        array.push(self[i]) if yield(self[i])
      else
        if self[i]
          array.push(self[i])
        end
      end
      i += 1
    end
    return nil if array.empty?
    array
  end

  def my_all?(_argv = 0)
    i = 0
    j = 0
    array = []
    while i < size
      if block_given?
        return false unless yield(self[i])

          j += 1
          array.push(self[i])
          return true if j == size
      else
        return false unless self[i]

          j += 1
          array.push(self[i])
          return true if j == size
      end
      i += 1
    end
    return true if array.empty?
  end

  def my_any?(_x = 0)
    i = 0
    array = []
    while i < size
      if block_given?
        return false unless yield(self[i])

          array.push(self[i])
          return true
      else
        return false unless self[i]

          array.push(self[i])
          return true
      end
      i += 1
    end
    return true if array.empty?
  end

  def my_none?(_x = 0)
    i = 0
    array = []
    while i < size
      if block_given?
        return true unless yield(self[i])
          array.push(self[i])
          return false
      else
        return true unless self[i]
          array.push(self[i])
          return false
      end
      i += 1
    end
    return true if array.empty?
  end

  def my_count(argv = nil)
    i = 0
    j = 0
    o = 0
    while i < size
      if x.is_a? Numeric
        j += 1 if self[i] == argv
      elsif argv.nil?
        j += 1
        o += 1 unless self[i]
      end
      i += 1
    end
    if o.positive?
      return o
    else
      return j
    end
  end

  def my_map(_x = 0)
    i = 0
    array = *self
    result = []
    while i < size
      if block_given?
        result.push(yield(array[i]))
      else
        result.push(array[i])
      end
      i += 1
    end
    result
  end

  def my_inject(x = 0, _y = 0)
    i = 0
    array = *self
    result = x
    result_no_block = []
    while i < size
      if block_given?
        result = yield(result, array[i])
      else
        result_no_block.push(array[i])
      end
      i += 1
    end
    if block_given?
      return result
    else
      return result_no_block.sum
    end
  end
end

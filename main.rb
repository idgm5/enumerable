module Enumerable
  def my_each
    i = 0
    while i < size
      return self[i] unless block_given?

      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index(x = 0)
    return i = 0 unless x.positive?

    i = 0 + x
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
        if yield(self[i])
          array.push(self[i])
        end
      else
        if self[i]
          array.push(self[i])
        end
      end
      i += 1
    end
    if array.empty?
      return nil
    else
      return array
    end
  end

  def my_all?(x=0)
    i = 0
    j = 0
    array = []
    while i < size
      if block_given?
        if yield(self[i])
            j += 1
            array.push(self[i])
            if j == size
              return true
            end
          else
            return false
        end
      else
          if self[i]
            j += 1
            array.push(self[i])
            if j == size
              return true
            end
          else
            return false
          end
      end
      i += 1
    end
    if array.empty?
      return true
    end
  end

  def my_any?(x = 0)
    i = 0
    array = []
    while i < size
      if block_given?
        if yield(self[i])
          array.push(self[i])
          return true
        else
          return false
        end
      else
        if self[i]
          array.push(self[i])
          return true
        else
          return false
        end
      end
      i += 1
    end
    if array.empty?
      return true
    end
  end

  def my_none?(x = 0)
    i = 0
    array = []
    while i < size
      if block_given?
        if yield(self[i])
          array.push(self[i])
          return false
        else
          return true
        end
      else
        if self[i]
          array.push(self[i])
          return false
        else
          return true
        end
      end
      i += 1
    end
    if array.empty?
      return true
    end
  end

  def my_count(x = nil)
    i = 0
    j = 0
    o = 0
    while i < size
      if x.is_a? Numeric
        if self[i] == x
          j += 1
        end
      elsif x.nil?
          j += 1
          unless self[i]
            o += 1
          end
      end
      i += 1
    end
    if o.positive?
      return o
    else
      return j
    end
  end

  def my_map(x = 0)
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
    return result
  end

  def my_inject(x = 0, y = 0)
    i  = 0
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

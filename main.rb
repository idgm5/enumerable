module Enumerable
  def my_each
    i = 0
    while i < size
      if block_given?
        yield(self[i])
      else
        break
      end
      i += 1
    end
  end
  def my_each_with_index(x=0)
    if x == 0
      i = 0
    else
      i = 0 + x
    end
    while i < size
      if block_given?
        yield(self[i], i)
      else
        break
      end
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
        break
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
  def my_any?
    i = 0
    while i < size
      if self[i] = true || self.empty?
        yield(self)
      else
        break
      end
      i += 1
    end
  end
  def my_none?
    i = 0
    j = 0
    while i <= size
      i += 1
      if self[i] = false || self.empty?
        j += 1
        if j == size
          yield(self)
        end
      else
        break
      end
    end
  end
  def my_count
    i = 0
    j = 0
    while i <= size
      i += 1
      if self[i] = true
        j +=1
      end
    end
    yield(j)
  end
  def my_map

  end
  def my_inject

  end
end

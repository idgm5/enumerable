module Enumerable
  def my_each
    i = 0
    while i <= size
      yield(self[i])
      i += 1
    end
  end
  def my_each_with_index
    i = 0
    while i <= size
      yield(self[i], i)
      i += 1
    end
  end
  def my_select
    j = 0
    while j <= size
      if self[i] = true
        yield(self[i])
      end
      j += 1
    end
  end
  def my_all?
    i = 0
    j = 0
    while i <= size
      if self[i] = true
        j += 1
        if j >= size
          yield(self)
        end
      else
        break
      end
    end
  end
  def my_any?
    i = 0
    while i <= size
      i += 1
      if self[i] = true || self.empty?
        yield(self)
      else
        break
      end
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

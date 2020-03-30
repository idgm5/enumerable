module Enumerable
  def my_each
    i = 0
    while i < size
      return to_enum unless block_given?

      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index(argv = 0)
    i = 0 unless argv.positive?

    i = 0 + argv
    while i < size
      return to_enum unless block_given?

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
        to_enum
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

  def my_any?(_argv = 0)
    i = 0
    array = []
    size.times do
      if block_given?
        return false unless yield(self[i])

        array.push(self[i])
        return true
      else
        return false unless self[i]

        array.push(self[i])
        return true
      end
    end
    return true if array.empty?
  end

  def my_none?(_argv = 0)
    i = 0
    array = []
    size.times do
      if block_given?
        return true unless yield(self[i])

        array.push(self[i])
      else
        return true unless self[i]

        array.push(self[i])
      end
    end
    return true if array.empty?
  end

  def my_count(argv = nil)
    i = 0
    j = 0
    o = 0
    while i < size
      if argv.is_a? Numeric
        j += 1 if self[i] == argv
      elsif argv.nil?
        j += 1
        o += 1 unless self[i]
      end
      i += 1
    end
    return o if o.positive?

    j
  end

  def my_map(_argv = 0)
    i = 0
    array = *self
    result = []
    while i < size
      if block_given?
        result.push(yield(array[i]))
      else
        return to_enum
      end
      i += 1
    end
    result
  end

  def my_inject(argv = 0, _argv = 0)
    i = 0
    array = *self
    result = argv
    result_no_block = []
    while i < size
      if block_given?
        result = yield(result, array[i])
      else
        result_no_block.push(array[i])
      end
      i += 1
    end

    return result if block_given?

    result_no_block.sum
  end
end

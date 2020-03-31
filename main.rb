# rubocop:disable Metrics/BlockNesting
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/ModuleLength
# rubocop:disable Style/IfInsideElse

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
    i = 0
    i = 0 + argv if argv.positive?
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

  def my_all?(argv = nil)
    i = 0
    array = []
    while i < size
      if block_given?
        return false unless yield(self[i])
      else
        if argv.is_a? Class
          return true if is_a? argv
        elsif argv.is_a? Regexp
          return false unless self[i].match(argv)
        elsif argv.nil?
          return false unless self[i]
        end
        array.push(self[i])
      end
      i += 1
    end
    return false unless array.empty?
    true
  end

  def my_any?(argv = nil)
    i = 0
    array = []
    while i < size
      if block_given?
        return true if yield(self[i])
      else
        if argv.is_a? Class
          return true if self[i].is_a? argv
        elsif argv.is_a? Regexp
          return false unless self[i].match(argv)
        elsif self[i]
          return true
        end
        array.push(self[i])
      end
      i += 1
    end
    return false if array.empty?
    false
  end

  def my_none?(argv = nil)
    i = 0
    array = []
    while i < size
      if block_given?
        return false if yield(self[i])
      else
        if argv.is_a? Class
          return false if self[i].is_a? argv
        elsif argv.is_a? Regexp
          return false if self[i].match(argv)
        elsif argv.is_a? Numeric
          return false if self[i] == argv
        end
        return false if argv.nil?
        array.push(self[i])
      end
      i += 1
    end
    return true if array.empty?
    true
  end

  def my_count(argv = nil)
    i = 0
    j = 0
    o = 0
    while i < size
      if block_given?
        j += 1 if yield(self[i])
      else
        if argv.is_a? Numeric
          j += 1 if self[i] == argv
        elsif argv.nil?
          j += 1
          o += 1 unless self[i]
        end
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
        result = to_enum
      end
      i += 1
    end
    result
  end

  def my_inject(argv = nil, argv2 = nil)
    array = *self
    memo = 0 if array[0].is_a? Numeric
    memo = '' if array[0].is_a? String
    memo = argv2 if argv2.is_a? Numeric
    memo = argv if argv.is_a? Numeric
    if block_given?
      array.my_each { |x| memo = yield(memo, x) }
    elsif argv2.nil?
      array.my_each { |x| memo = memo.send(argv, x) }
    else
      array.my_each { |x| memo = memo.send(argv2, x) }
    end
    memo
  end
end

def multiply_els(array)
  array = *array
  array.my_inject { |x, y| x * y }
end

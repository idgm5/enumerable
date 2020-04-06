# spec :main_spec.rb
require './main.rb'

RSpec.describe Enumerable do
  array = [11, 2, 3, 56]

  describe '.my_each' do
    context 'when receive a block' do
      it 'push each value to the result array' do
        result = []
        array.my_each { |x| result.push(x) }
        expect(result).to(eq(array))
      end
    end

    context 'when no block is given' do
      it 'returns an enumerator' do
        expect(array.my_each).to be_an Enumerator
      end
    end
  end

  describe '.my_each_with_index' do
    context 'when receive a block' do
      it 'push each value to the result array with index' do
        result = []
        array.my_each_with_index { |x, y| result.push([x, y]) }
        expect(result[0][1]).to(eq(0))
      end
    end

    context 'when no block is given' do
      it 'returns an enumerator' do
        expect(array.my_each_with_index).to be_an Enumerator
      end
    end
  end

  describe '.my_select' do
    context 'when receive a block' do
      it 'returns selected values' do
      
      end
    end

    context 'when no block is given' do
      it 'returns an enumerator' do
        expect(array.my_select).to be_an Enumerator
      end
    end
  end

end

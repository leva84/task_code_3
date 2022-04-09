require 'rspec'
require 'market'

describe Market do
  describe '#readlines' do
    it 'returns the array class' do
      expect(File.readlines("#{Dir.pwd}/lib/date/product_list.txt").class).to eql(Array)
    end
  end

  describe '#price' do
    it 'returns the hash class' do
      expect(Market.new.price.class).to eql(Hash)
    end
  end
end

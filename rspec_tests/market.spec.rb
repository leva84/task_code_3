# frozen_string_literal: true

require_relative 'spec_helper'

describe Market do
  describe '#readlines for initialize' do
    it 'returns the array class, not empty' do
      arrey = File.readlines("#{Dir.pwd}/lib/date/product_list.txt")

      expect(arrey.class).to eql(Array)
      expect(arrey.empty?).to eql(false)
    end
  end

  describe '#price' do
    it 'returns the hash class, not empty' do
      market = Market.new

      expect(market.price.class).to eql(Hash)
      expect(market.price.empty?).to eql(false)
    end
  end

  describe '#view_price' do
    it 'returns the array strings, not empty' do
      market = Market.new

      expect(market.view_price.class).to eql(Array)
      expect(market.view_price.empty?).to eql(false)
      expect(market.view_price[0]).to eql('a стоит 10$')
    end
  end
end

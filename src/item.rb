require_relative('osrs')
require_relative('runes')
require('json')
require('net/http')

# Items are anything that can be in your inventory.
#
# @author RubySometimes (GitHub)
# @version 24 September 2017
class Item

  # Attributes
  attr_reader :id
  attr_reader :name
  attr_reader :price
  attr_reader :store_price
  attr_reader :low_alch
  attr_reader :high_alch
  attr_reader :image

  # Creates a new Item object
  # @param id - the id of the Item
  def initialize(id)
    @id = id
    @name = generate_name
    @price = generate_price
    @store_price = generate_store
    @low_alch = (@store_price * 0.4).to_i
    @high_alch = (@store_price * 0.6).to_i
    @image = OSRS::GE_IMAGE + @id.to_s
  end

  private

  # Gets the name of the Item
  # @return the name of the Item
  def generate_name
    json = JSON.parse(shop_json)
    json[@id.to_s]['name']
  end

  # Gets the store price of the Item
  # @return the store price of the Item
  def generate_store
    json = JSON.parse(shop_json)
    json[@id.to_s]['store'].to_i
  end

  # Gets the average price of the Item on the GE
  # @return the average price on the GE
  def generate_price
    uri = URI(OSRS::GE_JSON + @id.to_s)
    json = JSON.parse(Net::HTTP.get(uri))
    json['overall'].to_i
  end

  # Gets the shop.json data
  # @return shop.json data as a String
  def shop_json
    json = ''
    File.open('../data/shop.json', 'r') do |f|
      f.each_line do |line|
        json += line
      end
      f.close
    end
    json
  end
end
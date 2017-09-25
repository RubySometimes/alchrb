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
  # @raise RunTimeError if the id is not an integer
  def initialize(id)
    raise 'Parameter id must be an Integer' unless id.instance_of? Integer
    @id = id
    @name = generate_name
    @price = generate_price
    @store_price = generate_store
    @low_alch = (@store_price * 0.4).to_i
    @high_alch = (@store_price * 0.6).to_i
    @image = OSRS::GE_IMAGE + @id.to_s
  end

  # Class method to get the item's id by name
  # @param item_name - the name of the item to search for
  # @return the item's id
  # @raise RunTimeError if the item doesn't exist
  def self.id_by_name(item_name)
    item_name = item_name.capitalize
    uri = URI(OSRS::SHOP_DATA)
    json = JSON.parse(Net::HTTP.get(uri))
    item_id = 0
    json.each { |id, name| item_id = id if name['name'].eql? item_name }
    raise "Item (#{item_name}) doesn't exist." if item_id.eql? 0
    item_id.to_i
  end

  private

  # Gets the name of the Item
  # @return the name of the Item
  def generate_name
    uri = URI(OSRS::SHOP_DATA)
    json = JSON.parse(Net::HTTP.get(uri))
    json[@id.to_s]['name']
  end

  # Gets the store price of the Item
  # @return the store price of the Item
  def generate_store
    uri = URI(OSRS::SHOP_DATA)
    json = JSON.parse(Net::HTTP.get(uri))
    json[@id.to_s]['store'].to_i
  end

  # Gets the average price of the Item on the GE
  # @return the average price on the GE
  def generate_price
    uri = URI(OSRS::GE_JSON + @id.to_s)
    json = JSON.parse(Net::HTTP.get(uri))
    json['overall'].to_i
  end
end
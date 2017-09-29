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
    @image = generate_image
  end

  # Class method to get the item's id by name
  # @param item_name - the name of the item to search for
  #        the item_name gets capitalized for search.
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

  # Checks if this item's GE price is less than another item's
  # @param other_item - the other item to compare to
  # @return true if this item is worth less than the other_item.
  def <(other)
    price < other.price
  end

  # Checks if this item's GE price is greater than another item's
  # @param other_item - the other item to compare to
  # @return true if this item is worth less than the other_item.
  def >(other)
    price > other.price
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
    price_to_int(json['item']['current']['price'])
  end

  # Gets the image url of the item.
  # @return the image url of the item as a string.
  def generate_image
    uri = URI(OSRS::GE_JSON + @id.to_s)
    json = JSON.parse(Net::HTTP.get(uri))
    json['item']['icon_large']
  end

  # Turns a price, like 1.9m and converts to an Integer.
  # @param price - the price of an item in string form
  # @return the integer form of a price.
  def price_to_int(price)
    price_float = clean_price(price.to_s)
    price_float *= 1_000_000 if price[-1] == 'm'
    price_float *= 1_000 if price[-1] == 'k'
    price_float.to_i
  end

  # Takes a price as a string, and removes any commas.
  # @param price - the price from the JSON in string form.
  def clean_price(price)
    price.sub(/,/, '').to_f
  end
end

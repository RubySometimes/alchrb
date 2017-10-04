# Alch.rb
A very simplistic Runescape Alchemy API that can help you get alch prices of certain items.  It's written in Ruby so that it can also be easily accessable within Rails.

## Installation
You can download the newest version of Alch.rb through Git.  Just enter the following in your command line:

`$ gem install alch`

That's it! You are now able to include the API into your projects.

To do so, include the src files in your project and when you'd like to use this API in a Class, just require the `alch.rb` file like so:

```ruby
require 'alch'
```

### Dependencies
Since this was written in Ruby, you will need Ruby to use this API.

## Usage Examples
A very basic use case:
```ruby
require 'alch'

# Create ruby and nature rune items
item = new Item(1603)
nature_rune = new Item(Runes::NATURE_RUNE_ID)

# output => 'Profit from alching Ruby: -692'
print "Profit from alching #{item.name}: "
puts item.high_alch - (item.price + nature_rune.price)
```

Alternatively, you can also get the Item's ID by the Item's name.

```ruby
require 'alch'

# Create ruby and nature rune items
item = new Item(Item.id_by_name('ruby'))
nature_rune = new Item(Runes::NATURE_RUNE_ID)

# output => 'Profit from alching Ruby: -692'
print "Profit from alching #{item.name}: "
puts item.high_alch - (item.price + nature_rune.price)
```

# Full Documentation
## Classes
* **[Item.rb](https://github.com/RubySometimes/alchrb/blob/master/docs/classes/Item.md)**


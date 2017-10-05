# Alch.rb
A simplistic Runescape Alchemy API that can help you get alch prices of certain items.

## Installation
You can get the newest gem of Alch.rb.  Just enter the following in your command line:

`$ gem install alch`

That's it! You are now able to include the API into your projects.

If you plan on using alch in a class or file, you have to require it at the top of your Ruby file, like so:

```ruby
require 'alch'
```

### Dependencies
Ruby 2.0 and up

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
[View the Full Documentation](http://www.rubydoc.info/gems/alch/1.1.0)

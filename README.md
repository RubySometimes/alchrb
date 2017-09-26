# Alch.rb
A very simplistic Runescape Alchemy API that can help you get alch prices of certain items.  It's written in Ruby so that it can also be easily accessable within Rails.

## Installation
You can download the newest version of Alch.rb through Git.  Just enter the following in your command line:

`$ git clone https://github.com/RubySometimes/alchrb`

That's it! You are now able to include the API into your projects.

To do so, include the src files in your project and when you'd like to use this API in a Class, just require the `alch.rb` file like so:

```ruby
require_relative('alchrb/alch')
```

### Dependencies
Since this was written in Ruby, you will need Ruby to use this API.

## Usage Examples
A very basic use case:
```ruby
require_relative('alch')

# Create whip and nature rune items
abby_whip = new Item(4151)
nature_rune = new Item(Runes::NATURE_RUNE_ID)

# output => 'Profit from alching Abyssal whip: -1843160'
print "Profit from alching #{whip.name}: "
puts whip.high_alch - (whip.price + nature_rune.price)
```

Alternatively, you can also get the Item's ID by the Item's name.

```ruby
require_relative('alch')

# Create whip and nature rune items
abby_whip = new Item(Item.id_by_name('abyssal whip'))
nature_rune = new Item(Runes::NATURE_RUNE_ID)

# output => 'Profit from alching Abyssal whip: -1843160'
print "Profit from alching #{whip.name}: "
puts whip.high_alch - (whip.price + nature_rune.price)
```

# Full Documentation
## Classes
* **[Item.rb](https://github.com/RubySometimes/alchrb/blob/master/docs/classes/Item.md)**


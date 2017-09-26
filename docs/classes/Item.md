# Item.rb
Items are anything that can be in your inventory.  In turn, anything that can be alched.

### Public Class Methods

#### new(integer) -> new_item
Creates a new Item of the specified `id`. 

While it constructs a new Item object, it fills the following
data: `id`, `name`, `price`, `store_price`, `low_alch`, `high_alch`, `image` more
on these later in the documentation.

**parameters:**
* `id` - the id of the Item

**raise:**
* RunTimeError if the `id` is not an integer

The `id` parameter must be an `Integer` if it is not, then 
a RunTimeError will be raised.

Example
```ruby
ruby = Item.new(1603) # => Item
ruby = Item.new('1603') # => RunTimeError
```

#### id_by_name(str) -> integer
Class method to get the item's id by name.

You can enter the name of the item any way you wish. Within the method the `str` gets `capitalized` for search.

**parameters:**
* `item_name` - the name of the item to search for

**raise:**

* RunTimeError if the `item_name` doesn't exist

Example
```ruby
uncut_ruby = Item.new(Item.id_by_name('uncut ruby')) # => Item
typo = Item.new(Item.id_by_name('uncitriby')) # => RunTimeError
```

### Public Instance Methods

#### id -> Integer
Gets the item's id as an Integer.

Example
```ruby
ruby = Item.new(1603) # => Item
ruby.id # => 1603
```

#### name -> String
Gets the item's name as a string.

Example
```ruby
some_item = Item.new(1619) # => Item
some_item.name # => 'Uncut ruby'
```

#### price -> Integer
Gets the item's Grand Exchange price as an integer.

Example
```ruby
ruby = Item.new(1603) # => Item
ruby.price # => 1076
```

#### store_price
Gets the item's store price as an integer.

Example
```ruby
ruby = Item.new(1603) # => Item
ruby.store_price # => 1000
```

#### low_alch -> Integer
Gets the item's low alchemy amount as an integer.

Example
```ruby
ruby = Item.new(1603) # => Item
ruby.low_alch # => 400
```

#### high_alch -> Integer
Gets the item's high alchemy amount as an integer.

Example
```ruby
ruby = Item.new(1603) # => Item
ruby.high_alch # => 600
```
#### image -> String
Gets the item's image URL as a string

Example
```ruby
ruby = Item.new(1603) # => Item
ruby.image # => 'http://services.runescape.com/m=itemdb_oldschool/1505990121692_obj_big.gif?id=1603'
```
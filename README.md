wot-api
========

A simple library that allows to interface with World of Tanks API v2.0!

## Installation

Add this line to your application's Gemfile:

    gem 'wot-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wot-api

## Usage

```ruby
require 'wot/api'

# create a new instance of api
api = Wot::Api.new("EU")

# search players by nickname
players = api.search("my-nickname")

# iterate found players and get detailed info
players.each do |player|
    puts player.id
    
    # get player's detailed information
    info = player.info
    
    # get player's tanks
    tanks = player.tanks
    
    # get player's statistics
    statistics = player.statistics
    
    # get player's achievements
    achievements = player.achievements
end
```

## Contributing

1. Fork it ( https://github.com/serioja90/wot-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

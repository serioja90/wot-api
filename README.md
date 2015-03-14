wot-api
========

A simple library that allows to interface with World of Tanks API v2.0!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wot-api'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install wot-api
```

## Usage

First of all, you have to create a new instance of `Wot::Api`, so you have to do:

```ruby
require 'wot/api'

region   = "EU" # valid regions are ['RU', 'EU', 'NA', 'ASIA', 'KR']
language = "en" # if not specified or not supported, the default language will be 'en'

api = Wot::Api.new(region, language)
```

Now, you can use the `api` object to query World of Tanks via API:

```ruby
# search players by nickname
players = api.player("my-nickname")

# search players by id
players = api.players([12345, 23456, ...])

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

wot-api
========

A simple library that allows to interface with World of Tanks API v2.0!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wot-api'
```
Or if you want to install the gem directly from github, use:

```ruby
gem 'wot-api', '~> 2.0.0', git: 'git://github.com/serioja90/wot-api.git'
```

And then execute:

```bash
$ bundle install
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
# find player by nickname
player  = api.players::search(NICKNAME)                    # return a single result
players = api.players::search(NICKNAME, {}, 'startswith' ) # returns a list of players

player.id           # returns player's ID
player.info         # returns more details about player
player.tanks        # returns a list of player's tanks with some statistics
player.statistics   # returns some statistics about player
player.achievements # returns a list of player's achievements
```
For more details about available options and API endpoints see
[Wargaming API Reference](https://eu.wargaming.net/developers/api_reference/wot/account/list/).

## Contributing

1. Fork it ( https://github.com/serioja90/wot-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

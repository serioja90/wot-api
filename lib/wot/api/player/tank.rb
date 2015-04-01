
module Wot
  class Api::Player::Tank
    attr_accessor :api, :data

    def initialize(api, data)
      @api  = api
      @data = data
    end

    def battles
      @data[:statistics][:battles]
    end

    def wins
      @data[:statistics][:wins]
    end

    private

    def method_missing(name, *args, &block)
      if @data.keys.include?(name.to_s)
        @data[name]
      else
        super name, *args, &block
      end
    end

  end
end
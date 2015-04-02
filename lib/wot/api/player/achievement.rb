
module Wot
  class Api::Player::Achievement
    attr_accessor :api, :data, :name, :current, :frags, :max

    def initialize(api, data)
      @api     = api
      @data    = data
      @name    = @data[:name]
      @current = @data[:current]
      @frags   = @data[:frags]
      @max     = @data[:max]
    end
  end
end
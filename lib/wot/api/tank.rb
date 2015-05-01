
module Wot
  class Api::Tank
    require 'wot/api/tank/info'

    attr_accessor :api, :data

    def initialize(api, data)
      @api  = api
      @data = data
    end

    def id
      self.tank_id
    end

    def premium?
      self.is_premium
    end

    def light?
      self.type == 'lightTank'
    end

    def medium?
      self.type == 'mediumTank'
    end

    def heavy?
      self.type == 'heavyTank'
    end

    def destroyer?
      self.type == 'AT-SPG'
    end

    def artillery?
      self.type == 'SPG'
    end

    def info
      @info ||= @api.tanks::info(self.id)
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
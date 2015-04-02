
module Wot
  class Api::Player
    require 'wot/api/player/info'
    require 'wot/api/player/tank'
    require 'wot/api/player/achievement'
    require 'wot/api/player/statistics'

    attr_accessor :api, :data

    def initialize(api, data)
      @api  = api
      @data = data
    end

    def id
      self.account_id
    end

    def tanks
      @tanks ||= @api.players::tanks(self.id)
    end

    def achievements
      @achievements ||= @api.players::achievements(self.id)
    end

    def info
      @info ||= @api.players::info(self.id)
    end

    def stats
      @stats ||= @api.players::stats(self.id)
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
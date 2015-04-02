
require 'wot/player/statistics'
require 'wot/player/extended_statistics'

module Wot
  class Api::Player
    require 'wot/api/player/info'
    require 'wot/api/player/tank'
    require 'wot/api/player/achievement'

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
      @stats ||= get_stats
    end

    private

    def method_missing(name, *args, &block)
      if @data.keys.include?(name.to_s)
        @data[name]
      else
        super name, *args, &block
      end
    end

    def get_stats
      response = @api.make_request :account, :info, { account_id: @id, fields: 'statistics' }

      Wot::Player::Statistics.new(self, response[:data][@id.to_s][:statistics])
    end
  end
end
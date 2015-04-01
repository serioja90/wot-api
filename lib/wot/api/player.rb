
require 'wot/player/achievement'
require 'wot/player/statistics'
require 'wot/player/extended_statistics'

module Wot
  class Api::Player
    require 'wot/api/player/info'
    require 'wot/api/player/tank'

    attr_accessor :api, :data

    def initialize(api, data)
      @api = api
      @data = data
    end

    def tanks
      @tanks ||= @api.players::tanks(self.account_id)
    end

    def achievements
      @achievements ||= get_achievements
    end

    def info
      @info ||= @api.players::info(self.account_id)
    end

    def stats
      @stats ||= get_stats
    end

    # Find a player or a list of players by their id
    def self.find(api, account_ids, options = {})
      ids = (account_ids.class == Array ? account_ids : [account_ids]).join(',')
      parameters = { account_id: ids }
      parameters = parameters.merge options
      response   = api.make_request :account, :info, parameters
      return create_players_from_data response[:data].values, api
    end

    private

    def method_missing(name, *args, &block)
      if @data.keys.include?(name.to_s)
        @data[name]
      else
        super name, *args, &block
      end
    end

    def get_tanks
      tanks = []
      response = @api.make_request :account, :tanks, { account_id: @id }
      response[:data][@id.to_s].each do |data|
        tanks << Wot::Player::Tank.new(self, data)
      end

      tanks
    end

    def get_achievements
      achievements = []
      response = @api.make_request :account, :achievements, { account_id: @id }
      data = response[:data][@id.to_s]
      names = data[:achievements].keys + data[:max_series].keys
      names.each do |name|
        achievements << Wot::Player::Achievement.new(name, data[:achievements][name], data[:max_series][name])
      end

      achievements
    end

    def get_stats
      response = @api.make_request :account, :info, { account_id: @id, fields: 'statistics' }

      Wot::Player::Statistics.new(self, response[:data][@id.to_s][:statistics])
    end

    # create Wot::Player from data
    def self.create_players_from_data(data,api)
      players = []
      data.each do |item|
        players << Wot::Player.new(item, api)
      end
      return players
    end
  end
end
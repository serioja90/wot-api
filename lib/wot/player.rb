require 'wot/player/info'
require 'wot/player/tank'
require 'wot/player/achievement'
require 'wot/player/statistics'
require 'wot/player/extended_statistics'
module Wot
  class Player
    attr_accessor :id, :account_id, :nickname, :api

    def initialize(options, api)
      @api = api
      @id = options[:account_id]
      @account_id = @id
      @nickname = options[:nickname]
    end

    def tanks
      @tanks ||= get_tanks
    end

    def achievements
      @achievements ||= get_achievements
    end

    def info
      @info ||= get_info
    end

    def stats
      @stats ||= get_stats
    end

    # Search a list of players by nickname
    def self.search(api, nickname, options = {})
      parameters = {search: nickname}
      parameters = parameters.merge options
      response = api.make_request :account, :list, parameters
      return create_players_from_data response[:data], api
    end

    # Find a player or a list of players by their id
    def self.find(api, account_ids, options = {})
      parameters = {
        account_id: (account_ids.class == Array ? account_ids : [account_ids]),
        fields: 'account_id,nickname'
      }
      parameters = parameters.merge options
      response = api.make_request :account, :info, parameters
      return create_players_from_data response[:data].values, api
    end

    private

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

    def get_info
      fields = %w(clan_id global_rating client_language last_battle_time logout_at created_at updated_at)
      response = @api.make_request :account, :info, {
        account_id: @id,
        fields: fields.join(',')
      }

      Wot::Player::Info.new(self, response[:data][@id.to_s])
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

    def method_missing(method_name, *args, &block)
      info
      return @info.send method_name
    end
  end
end
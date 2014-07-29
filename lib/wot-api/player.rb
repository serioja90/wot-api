
module Wot
  class Player
    autoload :Info,                   'wot-api/player/info'
    autoload :Tank,                   'wot-api/player/tank'
    autoload :Achievement,            'wot-api/player/achievement'
    autoload :Statistics,             'wot-api/player/statistics'
    autoload :ExtendedStatistics,     'wot-api/player/extended_statistics'

    attr_accessor :id, :account_id, :nickname, :api

    def self.search(api, nickname, options = {})
      parameters = {search: nickname}
      parameters = parameters.merge options
      response = api.make_request 'account/list/', parameters
      return create_players_from_data response[:data], api
    end

    def self.find(api, account_ids, options = {})
      parameters = {
        account_id: (account_ids.class == Array ? account_ids : [account_ids]),
        fields: 'account_id,nickname'
      }
      parameters = parameters.merge options
      response = api.make_request 'account/info/', parameters
      return create_players_from_data response[:data].values, api
    end

    def self.create_players_from_data(data,api)
      players = []
      data.each do |item|
        players << Wot::Player.new(item, api)
      end
      return players
    end

    def initialize(options, api)
      @api = api
      @id = options[:account_id]
      @account_id = @id
      @nickname = options[:nickname]
    end

    def tanks
      @tanks ||= Wot::Player::Tank.get_tanks(self,@api)
      return @tanks
    end

    def achievements
      @achievements ||= Wot::Player::Achievement.get_achievements(self,@api)
      return @achievements
    end

    def info
      @info ||= Wot::Player::Info.new(self, @api)
      return @info
    end

    private

    def method_missing(method_name, *args, &block)
      info
      return @info.send method_name
    end
  end
end
require 'json'
require 'rest-client'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/inflector'
require 'wot/api/clusters'
require 'wot/api/version'
require 'wot/api/endpoints'
require 'wot/api/helper'
require 'wot/api/error'
require 'wot/api/player'
require 'wot/tank'

module Wot
  class Api
    # The available translations.
    # Will be used to check if the selected language is a valid language
    # and will use 'en' instead of failing
    LANGUAGES = %w(en ru pl de fr es zh-ch tr cs th vi ko)
    
    def initialize(region, language = 'en')
      cluster = Wot::Api.cluster(region)
      @app_id = cluster[:application_id]
      @base_url = cluster[:base_url]
      @language = LANGUAGES.include?(language.to_s.downcase) ? language.to_s.downcase : 'en'
    end

    def players
      def self.search(nickname, params = {}, type = 'exact')
        params = params.dup.nested_under_indifferent_access
        params['type']   = type || 'exact'
        params['search'] = nickname
        data = make_request :account, :list, params

        result = parse_response(data, Wot::Api::Player)
        return params['type']['exact'] ? result.first : result
      end

      def self.list(ids, params = {})
        params['account_id'] = (ids.class == Array ? ids : [ids]).join(',')
        data = make_request :account, :list, params

        parse_response(data, Wot::Api::Player)
      end

      def self.info(id)
        fields = %w(clan_id global_rating client_language last_battle_time logout_at created_at updated_at)
        data = make_request :account, :info, { account_id: id, fields: fields.join(',') }

        parse_response(data[id.to_s], Wot::Api::Player::Info)
      end

      def self.tanks(id)
        data = make_request :account, :tanks, { account_id: id }

        parse_response(data[id.to_s], Wot::Api::Player::Tank)
      end

      def self.achievements(id)
        data     = []
        response     = make_request :account, :achievements, { account_id: id }
        names        = response[id.to_s].map{ |category, items | items.keys }.flatten.uniq
        achievements = response[id.to_s][:achievements]
        frags        = response[id.to_s][:frags]
        max_series   = response[id.to_s][:max_series]
        names.each do |name|
          data << {name: name, current: achievements[name], frags: frags[name], max: max_series[name]}
        end

        parse_response(data, Wot::Api::Player::Achievement)
      end

      def self.stats(id)
        request = make_request :account, :info, { account_id: id, fields: 'statistics' }
        data = request[id.to_s][:statistics]

        parse_response(data, Wot::Api::Player::Statistics)
      end

      self
    end

    # Returns a list of tanks
    # TODO: implement a cache system
    def tanks(options = {})
      tanks = []
      response = make_request :encyclopedia, :tanks, options
      response.each do |id, data|
        tanks << Wot::Tank.new(self, data)
      end

      tanks
    end

    def achievements_list()
      raise NotImplementedError
    end

    def engines_list()
      raise NotImplementedError
    end

    def guns_list()
      raise NotImplementedError
    end

    def radios_list()
      raise NotImplementedError
    end

    def suspensions_list()
      raise NotImplementedError
    end

    def turrets_list
      raise NotImplementedError
    end
  end
end
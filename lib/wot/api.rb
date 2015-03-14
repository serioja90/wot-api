require 'json'
require 'rest-client'
require 'active_support/core_ext/hash/indifferent_access'
require 'wot/api/clusters'
require 'wot/api/version'
require 'wot/api/endpoints'
require 'wot/api/helper'
require 'wot/api/error'
require 'wot/player'
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

    # Find a player by its nickname
    def player(nickname, options = {})
      options = options.dup.nested_under_indifferent_access
      options['type'] ||= 'exact'
      Wot::Player.search(self, nickname, options).first
    end

    # Find a list of players by their ids
    def players(ids, options = {})
      Wot::Player.find(self, ids, options)
    end

    # Returns a list of tanks
    # TODO: implement a cache system
    def tanks(options = {})
      tanks = []
      response = make_request :encyclopedia, :tanks, options
      response[:data].each do |id, data|
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
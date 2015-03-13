require 'json'
require 'rest-client'
require 'active_support/core_ext/hash/indifferent_access'
require 'wot/api/clusters'
require 'wot/api/version'
require 'wot/api/endpoints'
require 'wot/api/helper'
require 'wot/api/error'
require 'wot/player'

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

    def player(nickname)
      options = { type: 'exact' }

      Wot::Player.search(self, nickname, options).first
    end

    def search(username, options = {})
      return Wot::Player.search self, username, options
    end

    def find(account_ids, options = {})
      return Wot::Player.find self, account_ids, options
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
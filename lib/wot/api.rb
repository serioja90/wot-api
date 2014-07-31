require 'json'
require 'rest-client'
require 'active_support/core_ext/hash/indifferent_access'
require "wot/api/version"
require 'wot/api/clusters'
require 'wot/api/error'
require 'wot/player'

module Wot
  class Api
    
    def initialize(region, language = 'en')
      cluster = Wot::Api.cluster(region)
      @app_id = cluster[:application_id]
      @base_url = cluster[:base_url]
      @language = language
    end

    def search(username, options = {})
      return Wot::Player.search self, username, options
    end

    def find(account_ids, options = {})
      return Wot::Player.find self, account_ids, options
    end

    def players_info(account_ids)
      ids = (account_ids.class == Array ? account_ids : [account_ids])
      return make_request "account/info/", {:account_id => ids.join(",")}
    end

    def player_tanks(account_id)
      return make_request "account/tanks/", {:account_id => account_id}
    end

    def player_achievements(account_id)
      return make_request "account/achievements/", {:account_id => account_id}
    end

    def player_stats(account_id,hours_ago)
      return make_request "stats/accountbytime/", {:account_id => account_id, :hours_ago => hours_ago}
    end

    def player_raitings(account_id)
      return make_request "account/raitings/", {:account_id => account_id}
    end

    def tanks_list()
      return make_request "encyclopedia/tanks/", {}
    end

    def tank_info(tank_id)
      return make_request "encyclopedia/tankinfo/", {:tank_id => tank_id}
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

    def make_request(suffix,parameters)
      params = {:params => parameters.dup}
      params[:params][:application_id] = @app_id
      params[:params][:language] = @language
      response = JSON.parse(RestClient.get("#{@base_url}/2.0/#{suffix}", params))
      response = response.nested_under_indifferent_access
      raise Wot::Api::Error.new(response[:error]) if response[:status].downcase == "error"
      return response
    end
  end
end
#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-01 01:03:10
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-08 01:32:18
require 'json'
require 'rest-client'
require 'active_support/core_ext/hash/indifferent_access'

module Wot
  class Api
    def initialize(region, language = 'en')
      cluster = Wot::cluster(region)
      @app_id = cluster[:application_id]
      @base_url = cluster[:base_url]
      @language = language
    end

    def search(username)
      response = make_request "account/list/", {:search => username}
      if response.instance_of?(Wot::Error)
        return response
      else
        return Wot::Parser.get_players_list(response[:data],self)
      end
    end

    def players_info(account_ids)
      ids = (account_ids.class == Array ? account_ids : [account_ids])
      return make_request "account/info/", {:account_id => ids.join(",")}
    end

    def player_vehicles(account_id)
      return make_request "account/tanks/", {:account_id => account_id}
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
      return make_request "encyclopedia/achievements/", {}
    end

    def engines_list()
    end

    def guns_list()
    end

    def radios_list()
    end

    def suspensions_list()
    end

    def turrets_list
    end

    private

    def make_request(suffix,parameters)
      params = {:params => parameters.dup}
      params[:params][:application_id] = @app_id
      params[:params][:language] = @language
      response = JSON.parse(RestClient.get("#{@base_url}/2.0/#{suffix}", params))
      response = response.nested_under_indifferent_access
      if response[:status].downcase == "error"
        return Wot::Error.new(response[:error])
      else
        return response
      end
    end
  end
end

require 'wot-api/clusters'
require 'wot-api/parser'
require 'wot-api/error'
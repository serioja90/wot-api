#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-09 01:14:08
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-09 02:27:05
module Wot
  class Vehicle
    attr_accessor :id, :mark_of_mastery, :battles, :wins
    def initialize(data,api)
      @api = api
      @id = data[:tank_id]
      @mark_of_mastery = data[:mark_of_mastery]
      @battles = data[:statistics][:battles]
      @wins = data[:statistics][:wins]
    end

    private

    def api
      return @api
    end

    def info
      unless @info
        response = api.tank_info @id
        fail "Cannot retrieve tank info" if response.instance_of?(Wot::Error)
        self.info = Wot::VehicleInfo.new(response[:data][@id.to_s],api)
      end
      return @info
    end
  end
end

require 'wot-api/error'
require 'wot-api/vehicle_info'
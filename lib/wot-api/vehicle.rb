#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-09 01:14:08
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-10 02:01:01
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

    def respond_to?(method_name)
      info
      return @info && @info.respond_to?(method_name)
    end

    private

    def api
      return @api
    end

    def info
      unless @info
        response = api.tank_info @id
        fail "Cannot retrieve tank info" if response.instance_of?(Wot::Error)
        @info = Wot::VehicleInfo.new(response[:data][@id.to_s],api)
      end
      return @info
    end

    def method_missing(method_name, *args, &block)
      info
      return @info.send method_name unless @info.nil?
    end
  end
end

require 'wot-api/error'
require 'wot-api/vehicle_info'
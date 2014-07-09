#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-09 01:27:58
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-09 23:48:56
module Wot
  class VehicleInfo
    def initialize(data,api)
      @data = data
      @api = api
    end

    def data
      return data
    end

    def chassis
    end

    def crew
    end

    def engines
    end

    def guns
    end

    def radios
    end

    def turrets
    end

    private

    def api
      return api
    end

    def method_missing(method_name, *args, &block)
      return @data[method_name]
    end
  end
end
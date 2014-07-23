#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-09 01:27:58
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-23 01:50:30

require 'wot-api/info'

module Wot
  class VehicleInfo < Wot::Info
    def initialize(data,api)
      super data, api
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
  end
end
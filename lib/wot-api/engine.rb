#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-23 00:07:22
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-23 01:45:48

require 'wot-api/info'

module Wot
  class Engine < Wot::Info
    def initialize(data,api)
      super data, api
    end
  end
end

#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-08 00:22:27
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-10 01:37:31
module Wot
  class Achievement
    def initialize(data)
      @data = data
    end

    def data
      return data
    end

    private

    def method_missing(method_name, *args, &block)
      return @data[method_name]
    end
  end
end
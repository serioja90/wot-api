#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-08 00:22:27
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-10 01:57:24
module Wot
  class Achievement
    def initialize(data)
      @data = data
    end

    def data
      return data
    end

    def responds_to?(method_name)
      return @data.keys.include? method_name
    end

    private

    def method_missing(method_name, *args, &block)
      return @data[method_name]
    end
  end
end
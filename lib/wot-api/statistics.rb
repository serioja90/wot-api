#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-08 00:38:07
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-10 01:57:01
module Wot
  class Statistics
    def initialize(data)
      @data = data
    end

    def data
      return data
    end

    def battle_avg_exp
      return  xp.to_f / battles.to_f
    end

    def hits_percent
      return shots.to_f / hits.to_f
    end

    def respond_to?(method_name)
      return @data.keys.include? method_name
    end

    private

    def method_missing(method_name, *args, &block)
      return data[method_name]
    end
  end
end
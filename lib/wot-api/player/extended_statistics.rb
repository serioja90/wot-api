#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-24 01:26:14
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-24 01:37:01

module Wot
  class Player
    class ExtendedStatistics
      attr_accessor :data

      def initialize(data)
        @data = data
        @data.each do |key,_|
          self.send key
        end
      end

      private

      def method_missing(method_name, *args, &block)
        self.class.instance_eval do
          define_method method_name do 
            return @data[method_name]
          end
        end
      end
    end
  end
end
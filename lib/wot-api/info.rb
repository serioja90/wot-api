#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-23 00:09:43
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-23 02:29:57

module Wot
  class Info
    def initialize(data,api,skip_methods = [])
      @data = data
      @api = api
      skip_methods = skip_methods.map{|item| item.to_s}
      @data.each do |key,value|
        self.send(key.to_s) unless skip_methods.include?(key.to_s)
      end
    end

    def data
      return @data
    end

    def respond_to?(method_name)
      return @data.keys.include? method_name
    end

    protected

    def api
      return api
    end

    def method_missing(method_name, *args, &block)
      self.class.instance_eval do
        define_method method_name do 
          return @data[method_name]
        end
      end
    end
  end
end
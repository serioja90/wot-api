#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-07 22:30:55
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-24 00:57:23

module Wot
  class Error < StandardError
    attr_accessor :field, :message, :code, :value
    def initialize(options)
      super options[:message]
      @field = options[:field]
      @message = options[:message]
      @code = options[:code]
      @value = options[:value]
    end
  end
end
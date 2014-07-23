#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-07 22:30:55
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-23 01:45:54

module Wot
  class Error
    attr_accessor :field, :message, :code, :value
    def initialize(options)
      @field = options[:field]
      @message = options[:message]
      @code = options[:code]
      @value = options[:value]
    end
  end
end
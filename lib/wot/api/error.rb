module Wot
  class Api
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
end
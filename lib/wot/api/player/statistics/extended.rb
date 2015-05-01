
module Wot
  class Api::Player::Statistics::Extended
    attr_accessor :api, :data

    def initialize(api, data)
      @api  = api
      @data = data
    end

    private

    def method_missing(name, *args, &block)
      if @data.keys.include?(name.to_s)
        @data[name]
      else
        super name, *args, &block
      end
    end
  end
end
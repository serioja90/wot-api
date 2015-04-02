
module Wot
  class Api::Player::Statistics
    require 'wot/api/player/statistics/extended'

    attr_accessor :api, :data

    def initialize(api, data)
      @api  = api
      @data = data
    end

    def all
      @all ||= Wot::Api::Player::Statistics::Extended.new(@api, @data[:all])
    end

    def clan
      @clan ||= Wot::Api::Player::Statistics::Extended.new(@api, @data[:clan])
    end

    def company
      @company ||= Wot::Api::Player::Statistics::Extended.new(@api, @data[:company])
    end

    def historical
      @historical ||= Wot::Api::Player::Statistics::Extended.new(@api, @data[:historical])
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
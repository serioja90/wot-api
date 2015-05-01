
module Wot
  class Api::Player::Info
    attr_accessor :api, :data

    def initialize(api, data)
      @api  = api
      @data = data
    end

    def last_battle_time
      @last_battle_time ||= Time.at(@data[:last_battle_time])
    end

    def logout_at
      @logout_at ||= Time.at(@data[:logout_at])
    end

    def created_at
      @created_at ||= Time.at(@data[:created_at])
    end

    def updated_at
      @updated_at ||= Time.at(@data[:updated_at])
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
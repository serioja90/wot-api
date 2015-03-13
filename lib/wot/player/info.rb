
module Wot
  class Player
    class Info
      attr_accessor :player, :data, :account_id, :nickname, :clan_id, :global_rating, :language,
                    :last_battle_time, :logout_at, :created_at, :updated_at

      def initialize(player, data)
        @player           = player
        @data             = data
        @account_id       = player.id
        @nickname         = player.nickname
        @clan_id          = data[:clan_id]
        @global_rating    = data[:global_rating]
        @language         = data[:client_language]
        @last_battle_time = Time.at(data[:last_battle_time])
        @logout_at        = Time.at(data[:logout_at])
        @created_at       = Time.at(data[:created_at])
        @updated_at       = Time.at(data[:updated_at])
      end

      def api
        @player.api
      end
    end
  end
end

module Wot
  class Tank
    class Info

      def initialize(tank, data)
        @tank = tank
        @data = data
        @vehicle_armor_fedd     = data[:vehicle_armor_fedd]
        @engine_power           = data[:engine_power]
        @circular_vision_radius = data[:circular_vision_radius]
        @weight                 = data[:weight]
        @gun_damage_min         = data[:gun_damage_min]
        @image                  = data[:image]
        @is_premium             = data[:is_premium]
        @contour_image          = data[:contour_image]
        @short_name_i18n        = data[:short_name_i18n]
        @turret_armor_board     = data[:turret_armor_board]
        @gun_piercing_power_max = data[:gun_piercing_power_max]
        @max_health             = data[:max_health]
        @parent_tanks           = data[:parent_tanks]
        @id                     = data[:tank_id]
        @localized_name         = data[:localized_name]
        @radio_distance         = data[:radio_distance]
        @type_i18n              = data[:type_i18n]
        @chassis_rotation_speed = data[:chassis_rotation_speed]
        @gun_name               = data[:gun_name]
        @gun_max_ammo           = data[:gun_max_ammo]
        @nation_i18n            = data[:nation_i18n]
        @vehicle_armor_board    = data[:vehicle_armor_board]
        @nation                 = data[:nation]
        @gun_piercing_power_min = data[:gun_piercing_power_min]
        @turret_rotation_speed  = data[:turret_rotation_speed]
        @gun_rate               = data[:gun_rate]
        @is_gift                = data[:is_gift]
        @name                   = data[:name]
        @price_gold             = data[:price_gold]
        @level                  = data[:level]
        @type                   = data[:type]
        @image_small            = data[:image_small]
        @turret_armor_forehead  = data[:turret_armor_forehead]
        @speed_limit            = data[:speed_limit]
        @limit_weight           = data[:limit_weight]
        @price_xp               = data[:price_xp]
        @turret_armor_fedd      = data[:turret_armor_fedd]
        @price_credit           = data[:price_credit]
        @gun_damage_max         = data[:gun_damage_max]
        @name_i18n              = data[:name_i18n]
        @vehicle_armor_forehead = data[:vehicle_armor_forehead]
      end

      def api
        @tank.api
      end

      def radios
        @radios ||= nil
      end

      def engines
        @engines ||= nil
      end

      def crew
        @crew ||= nil
      end

      def guns
        @guns ||= nil 
      end

      def turrets
        @turrets ||= nil
      end

      def chassis
        @chassis ||= nil
      end
    end
  end
end
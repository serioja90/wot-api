#!/usr/bin/ruby
# @Author: Groza Sergiu
# @Date:   2014-07-09 01:27:58
# @Last Modified by:   Groza Sergiu
# @Last Modified time: 2014-07-09 02:27:15
module Wot
  class VehicleInfo
    def initialize(data,api)
      @chassis_rotation_speed = data[:chassis_rotation_speed]
      @circular_vision_radius = data[:circular_vision_radius]
      @contour_image = data[:contour_image]
      @engine_power = data[:engine_power]
      @gun_damage_max = data[:gun_damage_max]
      @gun_damage_min = data[:gun_damage_min]
      @gun_max_ammo = data[:gun_max_ammo]
      @gun_name = data[:gun_name]
      @gun_piercing_power_max = data[:gun_piercing_power_max]
      @gun_piercing_power_min = data[:gun_piercing_power_min]
      @gun_rate = data[:gun_rate]
      @image = data[:image]
      @image_small = data[:image_small]
      @is_gift = data[:is_gift]
      @is_premium = data[:is_premium]
      @level = data[:level]
      @limit_weight = data[:limit_weight]
      @max_health = data[:max_health]
      @name = data[:name]
      @name_i18n = data[:name_i18n]
      @nation = data[:nation]
      @nation_i18n = data[:nation_i18n]
      @price_credit = data[:price_credit]
      @price_gold = data[:price_gold]
      @radio_distance = data[:radio_distance]
      @speed_limit = data[:speed_limit]
    end
  end
end
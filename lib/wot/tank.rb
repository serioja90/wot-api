
require 'wot/tank/info'

module Wot
  class Tank
    attr_accessor :api, :id, :nation_i18n, :name, :level, :image, :image_small, :nation, :is_premium,
                  :type_i18n, :contour_image, :short_name_i18n, :name_i18n, :type

    def initialize(api, data)
      @api             = api
      @id              = data[:tank_id]
      @nation_i18n     = data[:nation_i18n]
      @name            = data[:name]
      @level           = data[:level]
      @image           = data[:image]
      @image_small     = data[:image_small]
      @nation          = data[:nation]
      @is_premium      = data[:is_premium]
      @type_i18n       = data[:type_i18n]
      @contour_image   = data[:contour_image]
      @short_name_i18n = data[:short_name_i18n]
      @name_i18n       = data[:name_i18n]
      @type            = data[:type]
    end

    def info
      @info ||= get_info
    end

    private

    def get_info
      response = @api.make_request :encyclopedia, :tankinfo, { tank_id: @id}

      Wot::Tank::Info.new(self, response[:data][@id.to_s])
    end
  end
end
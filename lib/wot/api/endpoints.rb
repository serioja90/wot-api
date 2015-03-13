module Wot
  class Api
    ENDPOINTS = {
      # Data about account, its tanks and achievements
      account:      %w(list info tanks achievements),

      # Authentication via OpenID
      auth:         %w(login prolongate logout),

      # Info about clan. (list, info and membersinfo could be disabled in the future)
      clan:         %w(list info provinces membersinfo),

      # Information about the status of the clan in clan wars. (accountpoints, accountpointshistory and
      # accountpointsrating could be disabled in the future)
      globalwar:    %w(clans maps provinces top tournaments battles accountpoints
                       accountpointshistory accountpointsrating clanpoints clanpointshistory
                       clanpointsrating clanprovinces),

      # Tankopedia
      encyclopedia: %w(tanks tankinfo tankengines tankturrets tankradios tankchassis tankguns
                       achievements info arenas),

      # Player ratings
      ratings:      %w(types dates accounts neighbors top),

      # Clan ratings
      clanratings:  %w(types dates clans neighbors top),

      # Statistics and achievements of player's tanks
      tanks:        %w(stats achievements)
    }

    def endpoint(namespace, action)
      actions = ENDPOINTS[namespace.to_sym]
      fail "Invalid endpoint namespace: '#{namespace}'!" unless actions
      fail "Invalid action '#{action}' for namespace '#{namespace}'!" unless actions.include?(action.to_s)

      @base_url + '/2.0/' + namespace.to_s + '/' + action.to_s + '/'
    end
  end
end
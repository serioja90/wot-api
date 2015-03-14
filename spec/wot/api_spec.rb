require 'spec_helper'

describe Wot::Api do

  it 'has a version number' do
    expect(Wot::Api::VERSION).not_to be nil
  end

  it 'should create a new api instance for each cluster' do
    Wot::Api::CLUSTERS.keys.each do |region|
      expect(Wot::Api.new(region)).not_to be nil
    end
  end

  it 'should find a player and all related info' do
    api          = Wot::Api.new("RU")
    player       = api.player("serioja90")
    tanks        = player.tanks
    achievements = player.achievements
    info         = player.info
    stats        = player.stats
    
    expect(player).not_to be nil
    expect(tanks).not_to be nil
    expect(achievements).not_to be nil
    expect(info).not_to be nil
    expect(stats).not_to be nil
  end
end

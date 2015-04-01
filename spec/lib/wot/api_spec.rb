#!/usr/bin/ruby
# @Author: sergiu
# @Date:   2015-04-02 00:13:44
# @Last Modified by:   sergiu
# @Last Modified time: 2015-04-02 00:20:48
require 'spec_helper'

describe Wot::Api do

  before do
    VCR.insert_cassette 'api', record: :new_episodes
  end

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

  it 'should find a player by id' do
    api     = Wot::Api.new("RU")
    player  = api.player("serioja90")
    players = api.players(player.id)
    expect(players).not_to be nil
    expect(players).not_to be_empty

    players = api.players([player.id])
    expect(players).not_to be nil
    expect(players).not_to be_empty
  end

  after do
    VCR.eject_cassette
  end
end

require 'spec_helper'

describe Wot::Api::Player::Statistics do

  before do
    VCR.insert_cassette 'wot/api/player/statistics', record: :new_episodes
    @api    = Wot::Api.new("RU")
    @player = @api.players::search("serioja90")
  end

  it "should exist" do
    expect(Wot::Api::Player::Statistics).not_to be nil
  end

  it "should return player statistics" do
    stats = @player.stats
    expect(stats).not_to be nil
    expect(stats).to be_instance_of Wot::Api::Player::Statistics
    expect(stats).to respond_to(:api)
    expect(stats).to respond_to(:data)
    expect(stats).to respond_to(:all)
    expect(stats).to respond_to(:clan)
    expect(stats).to respond_to(:company)
    expect(stats).to respond_to(:historical)
    expect(stats.api).to be_instance_of Wot::Api
    expect(stats.data).to be_kind_of Hash

    expect(stats.all).to be_instance_of Wot::Api::Player::Statistics::Extended
    expect(stats.clan).to be_instance_of Wot::Api::Player::Statistics::Extended
    expect(stats.company).to be_instance_of Wot::Api::Player::Statistics::Extended
    expect(stats.historical).to be_instance_of Wot::Api::Player::Statistics::Extended
    expect(stats.stronghold_defense).to be_instance_of Wot::Api::Player::Statistics::Extended
    expect(stats.stronghold_skirmish).to be_instance_of Wot::Api::Player::Statistics::Extended
    expect(stats.team).to be_instance_of Wot::Api::Player::Statistics::Extended

    expect(stats.all.data).not_to be nil
    expect(stats.clan.data).not_to be nil
    expect(stats.company.data).not_to be nil
    expect(stats.historical.data).not_to be nil
    expect(stats.stronghold_defense.data).not_to be nil
    expect(stats.stronghold_skirmish.data).not_to be nil
    expect(stats.team.data).not_to be nil
  end

  after do
    VCR.eject_cassette
  end
end
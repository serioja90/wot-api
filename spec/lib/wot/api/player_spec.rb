require 'spec_helper'

describe Wot::Api::Player do

  before do
    @api = Wot::Api.new("RU")
    VCR.insert_cassette 'wot/api/player', record: :new_episodes
  end

  it "should exist" do
    expect(Wot::Api::Player).not_to be nil
  end

  it "should search a player" do
    player = @api.players::search("serioja90")
    expect(player).not_to be nil
    expect(player).to be_instance_of Wot::Api::Player
    expect(player).to respond_to(:api)
    expect(player).to respond_to(:data)
    expect(player).to respond_to(:id)
    expect(player).to respond_to(:info)
    expect(player).to respond_to(:tanks)
    expect(player).to respond_to(:achievements)
    expect(player).to respond_to(:stats)
    expect(player.account_id).to be_instance_of(Fixnum)
    expect(player.id).to be_instance_of(Fixnum)
    expect(player.id).to match(player.account_id)
    expect(player.nickname).to be_instance_of(String)
    expect(player.api).to be_instance_of(Wot::Api)
    expect(player.data).to be_kind_of(Hash)
  end

  it "should return a list of players with similar nickname" do
    players = @api.players::search("serioja90", {}, "startswith")
    expect(players).not_to be nil
    expect(players).not_to be_empty
    expect(players).to be_instance_of(Array)
    players.each do |player|
      expect(player).not_to be nil
      expect(player).to be_instance_of(Wot::Api::Player)
    end
  end

  after do
    VCR.eject_cassette
  end
end
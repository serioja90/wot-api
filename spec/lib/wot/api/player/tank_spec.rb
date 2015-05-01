require 'spec_helper'

describe Wot::Api::Player::Tank do

  before do
    VCR.insert_cassette 'wot/api/player/tank', record: :new_episodes
    @api    = Wot::Api.new("RU")
    @player = @api.players::search("serioja90")
  end

  it "should exist" do
    expect(Wot::Api::Player::Tank).not_to be nil
  end

  it "should return a list of tanks that belong to the player" do
    tanks = @player.tanks
    expect(tanks).not_to be nil
    expect(tanks).not_to be_empty
    expect(tanks).to be_instance_of Array

    tanks.each do |tank|
      expect(tank).not_to be nil
      expect(tank).to be_instance_of Wot::Api::Player::Tank
      expect(tank).to respond_to(:api)
      expect(tank).to respond_to(:data)
      expect(tank).to respond_to(:battles)
      expect(tank).to respond_to(:wins)
      expect(tank.tank_id).to be_instance_of Fixnum
      expect(tank.id).to be_instance_of Fixnum
      expect(tank.id).to match(tank.tank_id)
    end
  end

  after do
    VCR.eject_cassette
  end
end
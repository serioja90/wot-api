require 'spec_helper'

describe Wot::Api::Player::Achievement do

  before do
    VCR.insert_cassette 'wot/api/player/achievement', record: :new_episodes
    @api    = Wot::Api.new("RU")
    @player = @api.players::search("serioja90")
  end

  it "should exist" do
    expect(Wot::Api::Player::Achievement).not_to be nil
  end

  it "should return a list of achievemets of the player" do
    achievements = @player.achievements
    expect(achievements).not_to be nil
    expect(achievements).not_to be_empty
    expect(achievements).to be_instance_of Array

    achievements.each do |achievement|
      expect(achievement).not_to be nil
      expect(achievement).to be_instance_of Wot::Api::Player::Achievement
      expect(achievement).to respond_to(:api)
      expect(achievement).to respond_to(:data)
      expect(achievement).to respond_to(:name)
      expect(achievement).to respond_to(:current)
      expect(achievement).to respond_to(:frags)
      expect(achievement).to respond_to(:max)
    end
  end

  after do
    VCR.eject_cassette
  end
end
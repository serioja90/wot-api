require 'spec_helper'

describe Wot::Api::Player::Info do

  before do
    VCR.insert_cassette 'wot/api/player/info', record: :new_episodes
    @api    = Wot::Api.new("RU")
    @player = @api.players::search("serioja90")
  end

  it "should exist" do
    expect(Wot::Api::Player::Info).not_to be nil
  end

  it "should return player info" do
    info = @player.info
    expect(info).not_to be nil
    expect(info).to be_instance_of Wot::Api::Player::Info
    expect(info).to respond_to(:api)
    expect(info).to respond_to(:data)
    expect(info).to respond_to(:last_battle_time)
    expect(info).to respond_to(:logout_at)
    expect(info).to respond_to(:created_at)
    expect(info).to respond_to(:updated_at)
    expect(info.api).to be_instance_of Wot::Api
    expect(info.data).to be_kind_of Hash
    expect(info.last_battle_time).to be_instance_of Time
    expect(info.logout_at).to be_instance_of Time
    expect(info.created_at).to be_instance_of Time
    expect(info.updated_at).to be_instance_of Time
  end

  after do
    VCR.eject_cassette
  end
end
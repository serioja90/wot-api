require 'spec_helper'

describe Wot::Api::Tank do

  before do
    @api = Wot::Api.new('RU')
    VCR.insert_cassette 'wot/api/tank', record: :new_episodes
  end

  it "should exist" do
    expect(Wot::Api::Tank).not_to be nil
  end

  it "should return a list of tanks" do
    tanks = @api.tanks::list
    expect(tanks).not_to be nil
    expect(tanks).not_to be_empty
    expect(tanks).to be_instance_of Array

    tank = tanks.first
    expect(tank).not_to be nil
    expect(tank).to be_instance_of Wot::Api::Tank
    expect(tank).to respond_to(:id)
    expect(tank).to respond_to(:info)
    expect(tank).to respond_to(:premium?)
    expect(tank).to respond_to(:light?)
    expect(tank).to respond_to(:medium?)
    expect(tank).to respond_to(:heavy?)
    expect(tank).to respond_to(:destroyer?)
    expect(tank).to respond_to(:artillery?)
    expect(tank.id).to eq(tank.tank_id)
    expect(tank.id).not_to be nil
    expect(tank.id).to be_instance_of Fixnum
  end

  after do
    VCR.eject_cassette
  end
end
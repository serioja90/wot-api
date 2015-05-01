#!/usr/bin/ruby
# @Author: sergiu
# @Date:   2015-04-02 00:13:44
# @Last Modified by:   sergiu
# @Last Modified time: 2015-05-01 03:12:44
require 'spec_helper'

describe Wot::Api do

  before do
    @api = Wot::Api.new("RU")
    VCR.insert_cassette 'wot/api', record: :new_episodes
  end

  it "should exist" do
    expect(Wot::Api).not_to be nil
  end

  it "should have a version number" do
    expect(Wot::Api::VERSION).not_to be nil
    expect(Wot::Api).to respond_to(:version)
    expect(Wot::Api::VERSION).to eq(Wot::Api.version)
  end

  it "should create a new api instance for each cluster" do
    Wot::Api::CLUSTERS.keys.each do |region|
      expect(Wot::Api.new(region)).not_to be nil
    end
  end

  it "should implement :players method" do
    expect(@api).to respond_to(:players)
    %w(search info tanks achievements stats).each do |name|
      expect(@api.players).to respond_to(name)
    end
  end

  it "should implement :tanks method" do
    expect(@api).to respond_to(:tanks)
    %w(list).each do |name|
      expect(@api.tanks).to respond_to(name)
    end
  end

  after do
    VCR.eject_cassette
  end
end

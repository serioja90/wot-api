#!/usr/bin/ruby
# @Author: sergiu
# @Date:   2015-04-02 00:13:44
# @Last Modified by:   sergiu
# @Last Modified time: 2015-04-03 01:02:08
require 'spec_helper'

describe Wot::Api do

  before do
    @api = Wot::Api.new("RU")
    VCR.insert_cassette 'api', record: :new_episodes
  end

  it "has a version number" do
    expect(Wot::Api::VERSION).not_to be nil
  end

  it "should create a new api instance for each cluster" do
    Wot::Api::CLUSTERS.keys.each do |region|
      expect(Wot::Api.new(region)).not_to be nil
    end
  end

  it "should implement players method" do
    expect(@api).to respond_to(:players)
    %w(search list info tanks achievements stats).each do |name|
      expect(@api.players).to respond_to(name)
    end
  end

  after do
    VCR.eject_cassette
  end
end

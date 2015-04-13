require 'rails_helper'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

describe Competitor do
  describe "#fetch_clients method" do
    before(:all) do
      @test_competitor = FactoryGirl.create(:competitor)
      for n in 1..4 do
        @test_competitor.clients.create(name: "Client #{n}")
      end
    end

    it "should return an ActiveRecord collection of client objects" do
      expect(@test_competitor.fetch_clients.class).to eq(Client::ActiveRecord_Associations_CollectionProxy)
    end

    it "should create a new client object for new clients added to page content" do
      @test_competitor.fetch_clients
      added_client = Client.find_by(name: 'Client 5')
      expect(added_client).to be_truthy
    end

    it "should update a client record when a client is removed from page content" do
      @test_competitor.fetch_clients
      removed_client = Client.find_by(name: 'Client 3')
      expect(removed_client.dropped).to be_truthy 
    end

  end
end
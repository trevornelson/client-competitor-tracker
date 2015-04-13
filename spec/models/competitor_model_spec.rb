require 'rails_helper'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

describe Competitor do
  describe "#fetch_clients method" do

    let(:initial_request_body) { '<div class="clients">Client 1</div><div class="clients">Client 2</div><div class="clients">Client 3</div>' }
    let(:second_request_body) { '<div class="clients">Client 1</div><div class="clients">Client 3</div><div class="clients">Client 4</div>' }

    before(:each) do
      stub_request(:get, "www.example.com/clients/initial").
        to_return(:body => initial_request_body, :status => 200)

      stub_request(:get, "www.example.com/clients/second").
        to_return(:body => second_request_body, :status => 200)
    end    

    it "should return an ActiveRecord collection of client objects" do

    end

    it "should create new client objects from initial request" do

    end

    it "should create a new client object for new clients added to page content" do

    end

    it "should update a client record when a client is removed from page content" do

    end

  end
end
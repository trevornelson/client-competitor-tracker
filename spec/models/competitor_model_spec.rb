require 'rails_helper'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

describe Competitor do
  describe "#fetch_clients method" do
    let(:competitor) { Competitor.create() }
    let(:initial_request_body) { '<div class="clients">Client 1</div><div class="clients">Client 2</div><div class="clients">Client 3</div>' }
    let(:second_request_body) { '<div class="clients">Client 1</div><div class="clients">Client 3</div><div class="clients">Client 4</div>' }

    it "should return an ActiveRecord collection of client objects" do
      stub_request(:get, "www.example.com/clients").
        to_return(:body => initial_request_body, :status => 200)

    end

    it "should create new client objects from initial request" do
      stub_request(:get, "www.example.com/clients").
        to_return(:body => initial_request_body, :status => 200)



    end

    it "should create a new client object for new clients added to page content" do
      stub_request(:get, "www.example.com/clients").
        to_return(:body => second_request_body, :status => 200)
    


    end

    it "should update a client record when a client is removed from page content" do
      stub_request(:get, "www.example.com/clients").
        to_return(:body => second_request_body, :status => 200)



    end

  end
end
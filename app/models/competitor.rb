require 'open-uri'

class Competitor < ActiveRecord::Base
	belongs_to :user
	has_many :clients

  def fetch_clients
    scrape
    clients
  end

  def annual_retention_rate
    retention_rate(dropped_in_past(365.days), updated_in_past(365.days))
  end

  private


  def updated_in_past(time)
    clients.where("updated_at > ?", Time.now - time).count
  end

  def dropped_in_past(time)
    clients.where("updated_at > ? AND dropped = ?", Time.now - time, true).count
  end

  def retention_rate(dropped_clients, total_clients)
    (dropped_clients.to_f / total_clients.to_f)
  end

  def scrape
    page_content = Nokogiri::HTML(open(client_url))
    parse(page_content)
  end

  def parse(page_content)
    nodes = page_content.xpath(client_xpath)
    if nodes
      parsed_clients = nodes.map { |node| node.text }
      update_clients(parsed_clients)
    end
  end

  def update_clients(parsed_clients)
    clients.each do |existing_client|
      unless parsed_clients.include?(existing_client.name)
        existing_client.update(dropped: true)
      end
    end

    parsed_clients.each do |parsed_client|
      unless clients.find_by(name: parsed_client)
        clients.create(name: parsed_client)
      end
    end
  end
  
end
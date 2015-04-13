FactoryGirl.define do
  factory :competitor do
    name "Test Competitor"
    client_url "http://www.example.com/clients"
    client_xpath "//div[@class='clients']"
  end
end
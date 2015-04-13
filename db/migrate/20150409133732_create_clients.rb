class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.references :competitor
    	t.string	:name
    	t.string	:client_url
    	t.string	:client_xpath

    	t.timestamps
    end
  end
end

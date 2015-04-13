class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
    	t.references   :user
      t.string			 :name
      t.string       :client_url
      t.string       :client_xpath

    	t.timestamps
    end
  end
end

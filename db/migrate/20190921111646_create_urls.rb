class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :code
      t.string :long_url
      t.string :short_url
      t.integer :redirects_amount, default: 0
      t.string :page_title

      t.timestamps
    end
  end
end

class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :given_url
      t.string :slug
      t.integer :clicks, :default => 0
      t.string :snapshot
      t.string :title

      t.timestamps
    end
    execute "SELECT setval('links_id_seq', 1000)"
  end
end

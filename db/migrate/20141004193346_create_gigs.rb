class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.date :showdate
      t.references :band
      t.references :venue
      t.float :price
      t.string :url

      t.timestamps
    end
    add_index :gigs, :band_id
    add_index :gigs, :venue_id
  end
end

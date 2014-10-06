class RemoveColumnsFromGigs < ActiveRecord::Migration
  def change
    remove_column :gigs, :band_id
    remove_column :gigs, :venue_id
  end
end

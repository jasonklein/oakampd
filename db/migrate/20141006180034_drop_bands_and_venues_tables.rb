class DropBandsAndVenuesTables < ActiveRecord::Migration
  def change
    drop_table :bands
    drop_table :venues
  end
end

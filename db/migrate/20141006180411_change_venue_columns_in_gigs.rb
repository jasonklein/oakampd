class ChangeVenueColumnsInGigs < ActiveRecord::Migration
  def change
    rename_column :gigs, :venue, :venue_name

    add_column :gigs, :venue_address, :string
  end
end

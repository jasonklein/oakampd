class AddColumnsToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :band, :string
    add_column :gigs, :venue, :string
  end
end

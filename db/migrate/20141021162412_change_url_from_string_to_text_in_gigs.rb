class ChangeUrlFromStringToTextInGigs < ActiveRecord::Migration
  def change
    change_column :gigs, :url, :text
  end
end

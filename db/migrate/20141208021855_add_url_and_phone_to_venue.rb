class AddUrlAndPhoneToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :url, :string
    add_column :venues, :phone, :string
  end
end

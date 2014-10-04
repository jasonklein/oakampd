class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :street_address
      t.string :zipcode

      t.timestamps
    end
  end
end

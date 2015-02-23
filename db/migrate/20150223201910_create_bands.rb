class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :image
      t.string :image_credit
      t.string :website
      t.string :bandcamp
      t.string :facebook
      t.string :soundcloud

      t.timestamps
    end
  end
end

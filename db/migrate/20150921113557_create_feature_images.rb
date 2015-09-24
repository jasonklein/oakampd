class CreateFeatureImages < ActiveRecord::Migration
  def change
    create_table :feature_images do |t|
      t.string :image

      t.timestamps
    end
  end
end

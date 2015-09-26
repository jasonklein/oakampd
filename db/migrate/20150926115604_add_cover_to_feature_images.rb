class AddCoverToFeatureImages < ActiveRecord::Migration
  def change
    add_column :feature_images, :cover, :boolean, default: false
  end
end

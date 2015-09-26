class AddFeatureReferenceToFeatureImages < ActiveRecord::Migration
  def change
    add_column :feature_images, :feature_id, :integer
    add_index :feature_images, :feature_id
  end
end

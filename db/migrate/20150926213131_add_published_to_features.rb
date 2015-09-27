class AddPublishedToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :published, :boolean, default: false, null: false
  end
end

class AddFeaturesHeaderToContents < ActiveRecord::Migration
  def change
    add_column :contents, :features_header, :text
  end
end

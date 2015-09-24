class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.string :subtitle
      t.references :author
      t.text :body
      t.boolean :display_subtitle

      t.timestamps
    end
    add_index :features, :author_id
  end
end

class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :gigs_header
      t.text :venues_header
      t.text :bands_header
      t.text :about_header
      t.text :about_content

      t.timestamps
    end
  end
end

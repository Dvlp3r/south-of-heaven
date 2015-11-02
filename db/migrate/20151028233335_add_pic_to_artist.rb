class AddPicToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :pic, :string
  end
end

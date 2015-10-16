class AddInstgramtagToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :instagramtag, :string
  end
end

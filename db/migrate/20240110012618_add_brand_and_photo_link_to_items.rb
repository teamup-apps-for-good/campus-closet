class AddBrandAndPhotoLinkToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :brand, :text
    add_column :items, :photo_link, :string
  end
end

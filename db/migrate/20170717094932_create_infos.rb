class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|

      t.string :infoTitle
      t.string :address
      t.string :city
      t.string :region
      t.string :game
      t.string :infoPhone
      t.string :infoEmail
      t.string :infoUrl
      t.text :content
      t.string :info_image_url
      t.float :location_lat
      t.float :location_lng

      t.timestamps null: false
    end
  end
end

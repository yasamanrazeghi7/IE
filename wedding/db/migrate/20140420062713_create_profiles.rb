class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :brideName
      t.string :groomName
      t.string :userName
      t.string :photo
      t.date :ceremonyDate
      t.text :aboutUs
      t.belongs_to :user
      t.timestamps
    end
  end
end

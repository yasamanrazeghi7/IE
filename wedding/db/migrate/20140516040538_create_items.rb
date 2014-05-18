class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.boolean :status
      t.text :comment
      t.text :date
      t.cost :integer
      t.belongs_to :scheduler
      t.timestamps
    end
  end
end

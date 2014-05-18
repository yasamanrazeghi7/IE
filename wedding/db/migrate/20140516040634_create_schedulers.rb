class CreateSchedulers < ActiveRecord::Migration
  def change
    create_table :schedulers do |t|
    	t.belongs_to :user
    	t.totalCost :integer
        t.timestamps
    end
  end
end

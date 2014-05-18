class AddTotalCostToScheduler < ActiveRecord::Migration
  def change
    add_column :schedulers, :totalCost, :integer
  end
end

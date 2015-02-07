class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :label
      t.boolean :published

      t.timestamps
    end
  end
end

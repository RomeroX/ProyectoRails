class AddExtraAttributesToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :type, :string
    add_column :tasks, :progress, :integer
    add_column :tasks, :start_date, :date
    add_column :tasks, :due_date, :date
  end
end

class AddgradeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :grade, :integer
    add_column :users, :pta_officer, :string
    add_column :users, :pta_officer_history, :string
    add_column :users, :memo, :string
  end
end

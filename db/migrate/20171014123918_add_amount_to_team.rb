class AddAmountToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :amount, :integer
  end
end

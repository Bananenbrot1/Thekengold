class AddColorToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :color, :string
  end
end

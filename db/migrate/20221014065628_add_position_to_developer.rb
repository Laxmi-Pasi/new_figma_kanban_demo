class AddPositionToDeveloper < ActiveRecord::Migration[7.0]
  def change
    add_column :developers, :dev_position, :integer
  end
end

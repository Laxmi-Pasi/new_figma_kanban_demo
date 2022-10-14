class AddPositionToClientRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :client_requests, :position, :integer
  end
end

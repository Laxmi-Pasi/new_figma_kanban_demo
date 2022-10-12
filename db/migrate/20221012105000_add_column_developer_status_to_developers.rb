class AddColumnDeveloperStatusToDevelopers < ActiveRecord::Migration[7.0]
  def change
    add_column :developers, :developer_status, :integer
  end
end

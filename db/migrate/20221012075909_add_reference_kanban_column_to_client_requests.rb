class AddReferenceKanbanColumnToClientRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :client_requests, :kanban_column, null: false
  end
end

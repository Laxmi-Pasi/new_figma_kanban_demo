class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.references :client_request, null: false
      t.integer :no_of_resources
      t.timestamps
    end
  end
end

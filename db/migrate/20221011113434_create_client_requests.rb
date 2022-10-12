class CreateClientRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :client_requests do |t|
      t.string :customer_name

      t.timestamps
    end
  end
end

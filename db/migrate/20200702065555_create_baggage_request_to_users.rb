class CreateBaggageRequestToUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :baggage_request_to_users do |t|
      t.integer :baggage_request_id
      t.integer :required_id
      t.integer :requires_id

      t.timestamps
    end
  end
end

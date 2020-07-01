class CreateRequestToUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :request_to_users do |t|
      t.integer :request_id
      t.integer :request_user_id

      t.timestamps
    end
  end
end

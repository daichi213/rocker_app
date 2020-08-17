class ChangeToTimeToBaggageRequests < ActiveRecord::Migration[5.1]
  def change
    change_column :baggage_requests, :to_time, :datetime
  end
end

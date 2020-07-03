class RemoveColumnBaggagetypeToBaggageRequests < ActiveRecord::Migration[5.1]
  def change
    remove_column :baggage_requests, :large_scale_baggage, :integer
    remove_column :baggage_requests, :heavy_weight_baggage, :integer
    remove_column :baggage_requests, :precision_machine_baggage, :integer
    remove_column :baggage_requests, :dont_reverse_baggage, :integer
    remove_column :baggage_requests, :refrigerated_baggage, :integer
    remove_column :baggage_requests, :feezed_baggage, :integer
    remove_column :baggage_requests, :broken_article, :integer
  end
end

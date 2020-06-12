class RemoveColumnBaggageTypeToTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :large_scale_baggage, :integer
    remove_column :transactions, :heavy_weight_baggage, :integer
    remove_column :transactions, :precision_machine_baggage, :integer
    remove_column :transactions, :dont_reverse_baggage, :integer
    remove_column :transactions, :refrigerated_baggage, :integer
    remove_column :transactions, :feezed_baggage, :integer
    remove_column :transactions, :broken_article, :integer
  end
end

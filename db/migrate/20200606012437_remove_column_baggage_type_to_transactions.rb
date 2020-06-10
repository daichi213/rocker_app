class RemoveColumnBaggageTypeToTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :large_scale_baggage, :boolean
    remove_column :transactions, :heavy_weight_baggage, :boolean
    remove_column :transactions, :precision_machine_baggage, :boolean
    remove_column :transactions, :dont_reverse_baggage, :boolean
    remove_column :transactions, :refrigerated_baggage, :boolean
    remove_column :transactions, :feezed_baggage, :boolean
    remove_column :transactions, :broken_article, :boolean
  end
end

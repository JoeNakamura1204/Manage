class AddTxHashToDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :tx_hash, :string
  end
end

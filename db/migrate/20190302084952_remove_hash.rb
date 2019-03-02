class RemoveHash < ActiveRecord::Migration[5.2]
  def change
    remove_column(:documents, :hash)
  end
end

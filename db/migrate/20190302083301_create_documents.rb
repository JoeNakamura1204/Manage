class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :title, null:false
      t.text :content, null:false
      t.string :hash

      t.timestamps
    end
  end
end

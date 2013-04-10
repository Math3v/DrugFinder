class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.integer :id
      t.string :name
      t.string :code
      t.string :sukl_name
      t.string :form
      t.string :label
      t.stringproducer_id :usage
      t.integer :holder_id
      t.integer :supplier_id

      t.timestamps
    end
  end
end

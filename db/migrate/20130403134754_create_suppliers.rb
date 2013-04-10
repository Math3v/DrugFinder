class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end

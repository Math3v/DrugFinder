class CreateHolders < ActiveRecord::Migration
  def change
    create_table :holders do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end

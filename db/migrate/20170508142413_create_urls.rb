class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :value
      t.index :value

      t.timestamps
    end
  end
end

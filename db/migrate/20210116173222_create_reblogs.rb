class CreateReblogs < ActiveRecord::Migration[6.0]
  def change
    create_table :reblogs do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
    add_index :reblogs, :parent_id
    add_index :reblogs, :child_id
    add_index :reblogs, [:parent_id, :child_id]
  end
end

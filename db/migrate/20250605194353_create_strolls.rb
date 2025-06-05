class CreateStrolls < ActiveRecord::Migration[8.0]
  def change
    create_table :strolls do |t|
      t.datetime :date
      t.references :dogsitter, null: false, foreign_key: true
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end

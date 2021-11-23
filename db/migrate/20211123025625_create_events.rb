class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :description
      t.datetime :time
      t.integer :limit
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :location
      t.datetime :date_time
      t.integer :tickets_available

      t.timestamps
    end
  end
end

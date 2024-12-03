class CreateWelcomes < ActiveRecord::Migration[8.0]
  def change
    create_table :welcomes do |t|
      t.string :service
      t.string :service_description

      t.timestamps
    end
  end
end

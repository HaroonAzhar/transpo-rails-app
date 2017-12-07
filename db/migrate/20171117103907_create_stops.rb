class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops do |t|
      t.integer :number
      t.string :name
      t.text :details
      t.string :route_id

      t.timestamps
    end
  end
end

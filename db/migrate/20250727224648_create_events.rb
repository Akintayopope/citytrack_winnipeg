class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.references :ward, null: false, foreign_key: true
      t.string :name
      t.string :location
      t.date :event_date
      t.text :description

      t.timestamps
    end
  end
end

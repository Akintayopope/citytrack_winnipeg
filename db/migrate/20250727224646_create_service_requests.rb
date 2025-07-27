class CreateServiceRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :service_requests do |t|
      t.references :ward, null: false, foreign_key: true
      t.string :category
      t.text :description
      t.string :status
      t.date :request_date

      t.timestamps
    end
  end
end

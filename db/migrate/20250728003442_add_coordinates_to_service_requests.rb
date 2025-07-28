class AddCoordinatesToServiceRequests < ActiveRecord::Migration[8.0]
  def change
    add_column :service_requests, :latitude, :float
    add_column :service_requests, :longitude, :float
  end
end

class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :title
      t.float :latitude
      t.float :longitude
      t.string :memo

      t.timestamps
    end
  end
end

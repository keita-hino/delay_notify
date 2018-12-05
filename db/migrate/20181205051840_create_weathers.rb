class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.boolean :rain
      t.boolean :snow
      t.text :wind_deg
      t.numeric :wind_speed
      t.integer :city_id

      t.timestamps
    end
  end
end

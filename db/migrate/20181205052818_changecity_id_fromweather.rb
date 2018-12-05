class ChangecityIdFromweather < ActiveRecord::Migration[5.2]
  def change
    change_column :weathers, :city_id, :text
    rename_column :weathers, :city_id, :city_name
  end
end

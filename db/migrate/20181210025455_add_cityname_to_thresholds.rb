class AddCitynameToThresholds < ActiveRecord::Migration[5.2]
  def change
    add_column :thresholds, :city_name, :string
  end
end

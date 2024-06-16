class RemoveLifespanIncreasePerCigaretteFromSmokingData < ActiveRecord::Migration[7.0]
  def change
    remove_column :smoking_data, :lifespan_increase_per_cigarette, :float
  end
end

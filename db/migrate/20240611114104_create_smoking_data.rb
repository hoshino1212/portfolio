class CreateSmokingData < ActiveRecord::Migration[7.0]
  def change
    create_table :smoking_data do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_date
      t.decimal :cigarettes_per_day, precision: 10, scale: 2
      t.decimal :price_per_pack, precision: 10, scale: 2
      t.decimal :lifespan_increase_per_cigarette, precision: 10, scale: 2

      t.timestamps
    end
  end
end

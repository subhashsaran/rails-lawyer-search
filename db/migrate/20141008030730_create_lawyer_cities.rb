class CreateLawyerCities < ActiveRecord::Migration
  def change
    create_table :lawyer_cities do |t|
      t.string :lawyer_code
      t.string :lawyer_namestring
      t.string :location
      t.integer :exp
      t.float :average_rating

      t.timestamps
    end
  end
end

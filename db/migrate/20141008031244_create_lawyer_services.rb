class CreateLawyerServices < ActiveRecord::Migration
  def change
    create_table :lawyer_services do |t|
      t.string :lawyer_code
      t.string :service_code
      t.string :service_name
      t.float :service_charge

      t.timestamps
    end
  end
end

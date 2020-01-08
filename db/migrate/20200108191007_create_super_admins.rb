class CreateSuperAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :super_admins do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.date   :date_of_birth
      t.string :phone_number

      t.timestamps
    end
  end
end

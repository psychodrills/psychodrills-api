class CreateSchoolGroupAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :school_group_admins do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.references :school_group

      t.timestamps
    end
  end
end

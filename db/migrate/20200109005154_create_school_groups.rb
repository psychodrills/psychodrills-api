class CreateSchoolGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :school_groups do |t|
      t.string :group_name
      t.string :head_of_the_group
      t.string :email
      t.string :phone
      t.text   :address
      t.string :city
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end
end

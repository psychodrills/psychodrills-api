class CreateAdminMenuLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_menu_links do |t|

      t.timestamps
    end
  end
end

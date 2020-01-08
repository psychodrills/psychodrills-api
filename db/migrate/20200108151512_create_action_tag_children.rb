class CreateActionTagChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :action_tag_children do |t|
      t.string :name
      t.string :url
      t.string :icon
      t.boolean :is_active, :nil => false, :default => true
      t.boolean :is_deleted, :nil => false, :default => false
      t.references :action_tag

      t.timestamps
    end
  end
end

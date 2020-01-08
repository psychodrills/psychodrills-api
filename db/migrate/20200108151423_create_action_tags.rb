class CreateActionTags < ActiveRecord::Migration[6.0]
  def change
    create_table :action_tags do |t|
      t.string :name
      t.string :url
      t.string :icon
      t.string :type
      t.boolean :is_active, :nil => false, :default => true
      t.boolean :is_deleted, :nil => false, :default => false

      t.timestamps
    end
  end
end

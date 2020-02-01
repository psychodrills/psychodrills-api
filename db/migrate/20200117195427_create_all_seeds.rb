class CreateAllSeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :all_seeds do |t|
      t.string :file_name
      t.timestamps
    end
  end
end

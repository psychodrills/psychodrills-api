class CreateDomains < ActiveRecord::Migration[6.0]
  def change
    create_table :domains do |t|
      t.string :domain_name
      t.references :domain_record, :polymorphic => true

      t.timestamps
    end
  end
end

class CreateFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :flows do |t|
      t.string :title
      t.text :description
      t.references :default_responsable, foreign_key: { to_table: :users }
      t.references :created_by, foreign_key: { to_table: :users }
      t.integer :version_number

      t.timestamps
    end
  end
end

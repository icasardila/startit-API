class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.jsonb 'schema', {null: false, default: {}}
      t.timestamps
    end
  end
end

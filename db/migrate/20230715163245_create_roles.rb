class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :label

      t.timestamps
    end
    add_index :roles, :label, :unique => true
  end
end

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :reference, null: false
      t.string :alias
      t.string :entity, null: false
      t.datetime :deactivated_at
      t.text :description

      t.timestamps
    end

    add_index :accounts, :reference, unique: true
  end
end

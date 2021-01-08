class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :name
      t.string :mail
      t.string :phone
      t.integer :gender
      t.date :birthday
      t.date :join
      t.timestamps
    end
  end
end

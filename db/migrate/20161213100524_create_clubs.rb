class CreateClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
      t.references :organization, foreign_key: true
      t.string :name
      t.string :image
      t.integer :chatwork
      t.string :notification
      t.string :description
      t.integer :money, default: 0
      t.float :rating, default: 0.0
      t.boolean :is_active, default: false
      t.timestamps
    end
  end
end

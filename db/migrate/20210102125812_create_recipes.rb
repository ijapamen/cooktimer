class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name,       null: false
      t.integer :people_id, null: false
      t.text :material,     null: false
      t.text :step1,        null: false
      t.text :step2,        null: false
      t.text :step3,        null: false
      t.text :step4,        null: false
      t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end

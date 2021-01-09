class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name,       null: false
      t.integer :person_id, null: false
      t.text :material,     null: false
      t.text :step1,        null: false
      t.text :step2
      t.text :step3
      t.text :step4
      t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end

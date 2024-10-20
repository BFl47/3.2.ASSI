class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :nome
      t.string :colore
      t.integer :eta

      t.timestamps
    end
  end
end

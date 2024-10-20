class CreateMoviegoers < ActiveRecord::Migration[6.1]
  def change
    create_table :moviegoers do |t|
      t.integer :uid
      t.string :name

      t.timestamps
    end
  end
end

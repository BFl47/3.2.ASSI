class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer 'potatoes'
      t.text 'comments'
      t.references 'moviegoer'
      t.references 'movie'
      t.timestamps
    end
  end
end

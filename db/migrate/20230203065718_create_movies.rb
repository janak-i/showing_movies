class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :movie_name
      t.string :desc
      t.date :published_date
      

      t.timestamps
    end
  end
end

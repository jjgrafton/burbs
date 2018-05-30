class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :type
      t.integer :zipcode
      t.string :grade_range
      t.integer :enrollement
      t.integer :gs_rating
      t.integer :parent_rating
      t.string :town
      t.string :website
      t.string :overview_link
      t.string :ratings_link
      t.string :reviews_link
      t.integer :scale
      t.string :student_teacher_ratio
      t.integer :location_id
    end
  end
end

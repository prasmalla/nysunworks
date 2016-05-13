class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.references :school, index: true, foreign_key: true
      t.string :year
      t.integer :total_enrollment
      t.integer :grade_pk
      t.integer :grade_k
      t.integer :grade_1
      t.integer :grade_2
      t.integer :grade_3
      t.integer :grade_4
      t.integer :grade_5
      t.integer :grade_6
      t.integer :grade_7
      t.integer :grade_8
      t.integer :grade_9
      t.integer :grade_10
      t.integer :grade_11
      t.integer :grade_12
      t.integer :female
      t.integer :male
      t.integer :asian
      t.integer :black
      t.integer :hispanic
      t.integer :other
      t.integer :white
      t.integer :students_with_disabilities
      t.integer :english_language_learners
      t.integer :poverty
      t.timestamps null: false
    end
  end
end

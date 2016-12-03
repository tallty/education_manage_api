class CreateSyllabuses < ActiveRecord::Migration
  def change
    create_table :syllabuses do |t|
      t.references :training_course, index: true, foreign_key: true
      t.references :school, index: true, foreign_key: true
      t.datetime :course_time
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end

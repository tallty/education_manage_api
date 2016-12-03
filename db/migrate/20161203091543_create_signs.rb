class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.references :training_course, index: true, foreign_key: true
      t.references :school, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :sign_time

      t.timestamps null: false
    end
  end
end

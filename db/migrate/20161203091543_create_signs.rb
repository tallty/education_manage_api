class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.references :training_course, index: true
      t.references :school, index: true
      t.references :user, index: true
      t.datetime :sign_time

      t.timestamps null: false
    end
  end
end

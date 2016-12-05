class AddTeacherIdToSign < ActiveRecord::Migration
  def change
  	change_table :signs do |t|
      t.references :teachers, index: true
    end
  end
end

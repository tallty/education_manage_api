class AddTeacherIdToSyllabuses < ActiveRecord::Migration
  def change
  	change_table :syllabuses do |t|
      # t.references :teachers, index: true
      t.string :address 
    end
  end
end

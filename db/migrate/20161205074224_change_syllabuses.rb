class ChangeSyllabuses < ActiveRecord::Migration
  def change
  	change_table :syllabuses do |t|
      t.remove :school_id#, :teachers_id
      t.string :teacher 
    end
  end
end

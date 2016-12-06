class ThirChangeSyllabus < ActiveRecord::Migration
  def change
  	change_table :syllabuses do |t|
      t.remove :is_active 		
  	end
  end
end

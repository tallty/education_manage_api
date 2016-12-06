class ThirChangeSgins < ActiveRecord::Migration
  def change
  	change_table :signs do |t|
      t.remove :training_course_id, :sign_time 		
  	end
  end
end
class FourChangeSgins < ActiveRecord::Migration
  def change
  	change_table :signs do |t|
      t.remove :title, :teacher, :address 		
  	end
  end
end

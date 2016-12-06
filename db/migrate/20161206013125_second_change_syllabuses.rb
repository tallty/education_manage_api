class SecondChangeSyllabuses < ActiveRecord::Migration
  def change
  	change_table :syllabuses do |t|
      t.boolean :is_active, default: false  		
  	end
  end
end

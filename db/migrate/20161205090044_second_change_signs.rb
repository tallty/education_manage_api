class SecondChangeSigns < ActiveRecord::Migration
  def change
  	change_table :signs do |t|
      t.remove :school_id, :teachers_id
      t.string :title
      t.string :teacher 
      t.string :address
    end
  end
end

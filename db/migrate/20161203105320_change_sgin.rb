class ChangeSgin < ActiveRecord::Migration
  def change
  	change_table :signs do |t|
      t.references :syllabus, index: true
    end
  end
end

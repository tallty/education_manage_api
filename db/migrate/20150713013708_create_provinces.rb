class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :username
      t.string :name

      t.timestamps null: false
    end
  end
end

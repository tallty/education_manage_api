class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :content
      t.boolean :state, default: false
      t.references :admin, index: true

      t.timestamps null: false
    end
  end
end

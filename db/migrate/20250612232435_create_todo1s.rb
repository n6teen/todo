class CreateTodo1s < ActiveRecord::Migration[8.0]
  def change
    create_table :todo1s do |t|
      t.string :title
      t.boolean :status

      t.timestamps
    end
  end
end

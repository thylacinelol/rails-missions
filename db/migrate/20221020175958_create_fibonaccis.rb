class CreateFibonaccis < ActiveRecord::Migration[5.2]
  def change
    create_table :fibonaccis do |t|
      t.integer :value, null: false, limit: 8
      t.text :result, null: false
      t.float :runtime, null: false

      t.timestamps
    end
  end
end

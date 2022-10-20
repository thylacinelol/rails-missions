class AddCreatedAtIndexToFibonaccis < ActiveRecord::Migration[5.2]
  def change
    add_index :fibonaccis, :created_at
  end
end

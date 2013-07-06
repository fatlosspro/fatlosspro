class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :value
      t.integer :user_id

      t.timestamps
    end
  end
end

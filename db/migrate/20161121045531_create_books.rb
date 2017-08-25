class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.datetime :day_at
      t.string :tel

      t.timestamps null: false
    end
  end
end

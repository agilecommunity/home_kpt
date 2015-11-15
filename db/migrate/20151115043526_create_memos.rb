class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.string :kind, null: false
      t.string :content, null: false, limit: 100

      t.timestamps null: false
    end
  end
end

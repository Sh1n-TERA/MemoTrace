class CreateMemos < ActiveRecord::Migration[7.1]
  def change
    create_table :memos do |t|
      t.string :mode
      t.string :title
      t.text :content
      t.text :error_content
      t.text :cause
      t.text :solution
      t.string :tag
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

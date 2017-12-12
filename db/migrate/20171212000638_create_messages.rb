class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :author
      t.text :content
      t.integer :group_id

      t.timestamps
    end
  end
end

class CreateFaqs < ActiveRecord::Migration[5.1]
  def change
    create_table :faqs do |t|
      t.text :question
      t.text :answer
      t.integer :asked_by_user_id
      t.integer :answered_by_user_id
      t.boolean :is_visible, default: true
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end

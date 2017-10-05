class CreateGenericUploads < ActiveRecord::Migration[5.1]
  def change
    create_table :generic_uploads do |t|
      t.integer :user_id
      t.boolean :is_deleted

      t.timestamps
    end
  end
end

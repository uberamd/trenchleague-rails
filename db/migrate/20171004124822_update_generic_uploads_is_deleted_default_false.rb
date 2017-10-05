class UpdateGenericUploadsIsDeletedDefaultFalse < ActiveRecord::Migration[5.1]
  def change
    change_column_default :generic_uploads, :is_deleted, false
  end
end

class RenameUserIdIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :user_id_id, :user_id
  end
end

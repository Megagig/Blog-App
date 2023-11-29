class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :Name, :name
    rename_column :users, :Photo, :photo
    rename_column :users, :Bio, :bio
    rename_column :users, :PostCounter, :posts_counter
  end
end
class AddFaceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :face, :json
  end
end

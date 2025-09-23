class RemoveNamFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_columns(:users, :name, :birth, :city, :country, :gender, :role)
  end
end

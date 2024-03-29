class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column  :users, :name, :string, null: false, limit: 20
    add_column  :users, :first_name, :string, null: false
    add_column  :users, :last_name, :string, null: false
    add_column  :users, :first_name_kana, :string, null: false
    add_column  :users, :last_name_kana, :string, null: false
    add_column  :users, :postal_code, :integer, null: false
    add_column  :users, :prefecture, :integer, null: false
    add_column  :users, :city, :string, null: false
    add_column  :users, :address, :string, null: false
    add_column  :users, :building, :string
    add_column  :users, :phone, :string, null: false
    add_column  :users, :birthday, :date, null: false
    add_column  :users, :money, :integer, default: 0
    add_column  :users, :point, :integer, default: 0
    add_column  :users, :profile, :text, limit: 1000
  end
end

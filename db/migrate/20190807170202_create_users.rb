class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string      :nickname,      null: false
      t.text        :introduction,  null: true
      t.string      :icon,          null: true
      t.string      :email,         null: false, unique:true
      t.string      :password,      null: false
      t.timestamps
    end
  end
end

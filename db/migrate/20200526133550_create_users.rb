class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :sex
      t.date :birthday
      t.string :occupation
      t.string :address
      t.string :email
      t.string :picture
      t.boolean :admin
      t.string :password_digest
      t.string :remember_digest
      t.decimal :user_apparause_point

      t.timestamps
    end
  end
end

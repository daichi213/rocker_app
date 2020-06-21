class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :sex
      t.date :birthday
      t.string :occupation
      t.string :address
      t.decimal :longitude
      t.decimal :latitude
      t.string :email
      t.string :picture
      t.integer :admin
      t.string :password_digest
      t.string :remember_digest
      t.decimal :user_apparause_point
      t.integer :amount_billed
      t.integer :del_flag

      t.timestamps
    end
  end
end

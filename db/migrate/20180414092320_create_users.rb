class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :username
      t.string  :email
      t.text    :address 
      t.integer :phone
      t.string  :website
      t.text    :company
    end
  end
end

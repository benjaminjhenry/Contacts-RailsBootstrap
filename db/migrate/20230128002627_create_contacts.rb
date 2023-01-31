class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :mobilephone
      t.string :homephone
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.string :company
      t.string :birthday
      t.string :notes

      t.timestamps
    end
  end
end

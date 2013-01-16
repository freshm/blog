class AddHobbiesAndGenderAndCountryAndCityAndStreetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hobbies, :string
    add_column :users, :gender, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :street, :string
  end
end

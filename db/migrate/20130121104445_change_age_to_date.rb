class ChangeAgeToDate < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :age, :date
      t.rename :age, :birthday
    end
  end

  def down
  endchange_table :users do |t|
      t.change :age, :integer
      t.rename :birthday, :age
    end
  end
end

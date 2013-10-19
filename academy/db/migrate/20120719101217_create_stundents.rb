class CreateStundents < ActiveRecord::Migration
  def change
    create_table :stundents do |t|
      t.string :name
      t.string :lastname
      t.string :city
      t.string :email

      t.timestamps
    end
  end
end

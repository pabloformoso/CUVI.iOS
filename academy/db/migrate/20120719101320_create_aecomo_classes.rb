class CreateAecomoClasses < ActiveRecord::Migration
  def change
    create_table :aecomo_classes do |t|
      t.string :name
      t.datetime :starts_at
      t.datetime :ends_at
      t.text :description

      t.timestamps
    end
  end
end

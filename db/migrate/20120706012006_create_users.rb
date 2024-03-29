class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :photo
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end

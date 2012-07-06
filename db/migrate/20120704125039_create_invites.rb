class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :name
      t.string :email
      t.boolean :active, :default => false
      t.string :activate_key

      t.timestamps
    end
  end
end

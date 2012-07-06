class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :photo
      t.string :uf
      t.string :city

      t.timestamps
    end
  end
end

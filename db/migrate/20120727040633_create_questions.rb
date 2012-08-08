class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :enunciation
      t.boolean :objective

      t.timestamps
    end
  end
end

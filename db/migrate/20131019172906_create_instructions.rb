class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.text :body
      t.string :image
      t.string :video
      

      t.timestamps
    end
  end
end

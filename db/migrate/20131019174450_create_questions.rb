class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      
      t.text :choices
      t.text :correct_answer
      t.text :explanation
      t.string :image
      t.string :video

      t.timestamps
    end
  end
end

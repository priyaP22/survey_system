class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.text :answer
      t.references :user
      t.references :survey_response
      t.timestamps
    end
  end
end

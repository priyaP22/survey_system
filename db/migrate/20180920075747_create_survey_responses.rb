class CreateSurveyResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_responses do |t|
      t.references :survey
      t.references :user
      t.timestamps
    end
  end
end

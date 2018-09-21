class SurveyResponse < ApplicationRecord
  belongs_to :survey, optional: true
  belongs_to :user, optional: true
  has_many :responses,  dependent: :destroy
  accepts_nested_attributes_for :responses


end

class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  has_many :survey_responses,  dependent: :destroy
  accepts_nested_attributes_for :survey_responses
end

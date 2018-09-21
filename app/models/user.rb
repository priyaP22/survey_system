class User < ApplicationRecord
  has_many :survey_responses,  dependent: :destroy
  has_many :responses, dependent: :destroy
end

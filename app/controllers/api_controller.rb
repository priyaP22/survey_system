class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  private

  def survey_responses(survey)
    survey.survey_responses.map do |sr|
      {
        sr: responses(sr)
      }
    end
  end

  def responses(sr)
    sr.responses.each do |r|
      {
        question: r.question.title,
        answer: r.answer
      }
    end
  end
end

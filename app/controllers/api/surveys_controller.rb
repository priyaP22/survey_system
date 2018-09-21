module Api
  class SurveysController < ApiController

    def index
      render json: { collection: survey_serializer(Survey.all) }
    end

    def add_question
      survey = Survey.find(params[:survey_id])
      question = survey.questions.create(title: params[:title])
      render json: { "result" => question }
    rescue => e
      render json: { error: e }
    end

    def destroy_survey_questions
      survey = Survey.find(params[:survey_id])
      survey.questions.destroy_all
    rescue => e
      render json: { error: e }
    end

    def destroy_question
      question = Question.find(params[:id])
      question.destroy
    rescue => e
      render json: { error: e }
    end

    private

    def survey_serializer(surveys)
      surveys.map do |survey|
        {
          name: survey.name,
          description: survey.description,
          survey_responses: survey_responses(survey)
        }
      end

    end
  end
end

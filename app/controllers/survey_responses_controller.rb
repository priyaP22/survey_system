class SurveyResponsesController < ApplicationController
 def index
   @surveys = Survey.all
 end

 def show
   @survey = Survey.find(params[:id])
 end

 def new
   @survey = Survey.find(params[:id])
   @survey_response = @survey.survey_responses.build
   @empty_responses = []
   @survey.questions.each do |q|
     @empty_responses << Response.new(user: current_user, survey_response: @survey_response, question: q)
   end
 end


 def create
   @survey = Survey.find(params[:survey_id])
   @survey_response = @survey.survey_responses.build(user: current_user)
   @survey_response.save
   params["responses"].each do |key, value|
     @response =  @survey_response.responses.create(response_params(value))
   end

   if @response.save
     delete_written
     redirect_to survey_responses_path
   else
     render 'new'
    end

 end

 private

   def delete_written
     Response.where(answer: nil).delete_all
   end

   def current_user
     User.find(session[:user_id])
   end

   def response_params(responses)
      responses.permit(:answer, :user_id, :question_id)
   end
end

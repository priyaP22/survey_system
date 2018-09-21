class SurveysController < ApplicationController
  def index
   @surveys = Survey.all
 end

 def show
   @survey = Survey.find(params[:id])
   @survey_responses = @survey.survey_responses.includes(:responses)
 end

 def new
   @survey = Survey.new
   @survey.questions.build
 end

 def edit
   @survey = Survey.find(params[:id])
 end

 def create
   @survey = Survey.new(survey_params)
   if @survey.save
     redirect_to @survey
   else
     render 'new'
   end
 end

 def update
   @survey = Survey.find(params[:id])

   if @survey.update(survey_params)
     redirect_to @survey
   else
     render 'edit'
   end
 end

 def destroy
   @survey = Survey.find(params[:id])
   @survey.destroy

   redirect_to surveys_path
 end


 private
   def survey_params
     params.require(:survey).permit(:name, :description, questions_attributes: Question.attribute_names.map(&:to_sym).push(:_destroy))
   end
end

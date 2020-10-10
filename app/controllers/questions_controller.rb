class QuestionsController < ApplicationController

    def index
        @questions = Question.all
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)
        @question.save
    end

    private

    def question_params
      params.require(:quesiton).permit(:description)
    end
end
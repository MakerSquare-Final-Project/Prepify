class Admin::QuestionsController < ApplicationController
  before_action :set_question, only: [ :update, :destroy]
  before_filter :authorize_admin

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @subject = Subject.find(params[:subject_id])
  end

  # GET /questions/new
  def new
    @subject = Subject.find(params[:subject_id])
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    @subject = Subject.find(params[:subject_id])
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
   def create
    @subject = Subject.find(params[:subject_id])
    
    @question = Question.new(question_params)
    
    

    respond_to do |format|
      if @question.save
        @page = @subject.pages.create
        @page.pageable = @question
        @page.save
        format.html { redirect_to admin_subject_pages_path, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to admin_subject_pages_path, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
        params.require(:question).permit(:body, :text_choices, :correct_answer, :image, :explanation)
    end
end

class Admin::SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_admin

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
    @users= User.all
    @subject = Subject.new
    @user = current_user
    
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])
    @page = @subject.pages 
  end

  # GET /subjects/new
  def new
    respond_to do |format|
      format.js {@subject = Subject.new(section: params[:section])}
    end
  end

  # GET /subjects/1/edit
  def edit
   
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
    respond_to do |format|
      if @subject.save
        format.html { redirect_to admin_subject_pages_path(@subject), notice: 'Subject was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subject }
      else
        format.html { redirect_to admin_subjects_path, :alert => "Title can't be blank. Please try creating a lesson again." }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

    

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to admin_subject_pages_path(@subject), notice: 'Subject was successfully updated.' }
        format.json { head :no_content }
        format.js { render layout: false }
       
      else
        format.html { render action: 'edit' }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject_id = @subject.id
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to admin_subjects_path   }
      format.json { head :no_content }
      format.js { render layout: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :section, :published)
    end
end

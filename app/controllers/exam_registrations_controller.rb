class ExamRegistrationsController < ApplicationController
  before_action :set_exam_registration, only: [:show, :edit, :update, :destroy]

  # GET /exam_registrations
  # GET /exam_registrations.json
  def index
    @open_examinations = current_user.batch.examinations
  end

  # GET /exam_registrations/1
  # GET /exam_registrations/1.json
  def show
  end

  # GET /exam_registrations/new
  def new
    @exam_registration = ExamRegistration.new
    @papers = Examination.find(params[:exam_id]).papers
  end

  # GET /exam_registrations/1/edit
  def edit
  end

  # POST /exam_registrations
  # POST /exam_registrations.json
  def create
    byebug
    @exam_registration = ExamRegistration.new(exam_registration_params)

    respond_to do |format|
      if @exam_registration.save
        format.html { redirect_to @exam_registration, notice: 'Exam registration was successfully created.' }
        format.json { render :show, status: :created, location: @exam_registration }
      else
        format.html { render :new }
        format.json { render json: @exam_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_registrations/1
  # PATCH/PUT /exam_registrations/1.json
  def update
    respond_to do |format|
      if @exam_registration.update(exam_registration_params)
        format.html { redirect_to @exam_registration, notice: 'Exam registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_registration }
      else
        format.html { render :edit }
        format.json { render json: @exam_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_registrations/1
  # DELETE /exam_registrations/1.json
  def destroy
    @exam_registration.destroy
    respond_to do |format|
      format.html { redirect_to exam_registrations_url, notice: 'Exam registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_registration
      @exam_registration = ExamRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_registration_params
      params.require(:exam_registration).permit(:examination_id, :student_id, :paper_count, :fees_paid, paper_ids: [])
    end
end

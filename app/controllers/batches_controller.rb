class BatchesController < ApplicationController
  before_action :set_course, except: [:show, :edit, :update, :destroy, :paper_list, :papers, :students_list]
  before_action :set_batch, only: [:show, :edit, :update, :destroy, :paper_list, :papers, :students_list]

  # GET /batches
  # GET /batches.json
  def index
    @batches = @course.batches
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
  end

  # GET /batches/new
  def new
    @batch = Batch.new
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches
  # POST /batches.json
  def create
    @batch = Batch.new(batch_params)
    @batch.course = @course

    respond_to do |format|
      if @batch.save
        format.html { redirect_to @batch, notice: 'Batch was successfully created.' }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1
  # PATCH/PUT /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to @batch, notice: 'Batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @batch.destroy
    respond_to do |format|
      format.html { redirect_to course_batches_url(@batch.course), notice: 'Batch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def paper_list
    @papers = @batch.course.papers
    respond_to do |format|
      format.js
    end
  end

  def papers
    @syllabus = @batch.syllabus
    @papers = @batch.papers
  end

  def students_list
    @paper = Paper.find(params[:paper_id])
    # @paper = @batch.current_timetable.timetable_entries.where(teacher_id: current_user.profile.id,
    #  period_id: params[:period_id], wday: params[:date].to_date.wday).first.try(:paper)
    @students = @paper.optional ? @paper.optional_paper_enrollments.where(batch_id: @batch.id).select(:student_id).pluck(:student_id).map{ |student_id| Student.find(student_id) } : @batch.students
    @students = @students.order(:roll_no)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_batch
      @batch = Batch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.require(:batch).permit(:course_id, :name, :code, :start_date, :end_date)
    end
end

class CoursesController < ApplicationController
  before_action :set_department, except: [:show, :edit, :update, :destroy,
   :term_list, :syllabus_list, :batch_list]
  before_action :set_course, only: [:show, :edit, :update, :destroy,
   :term_list, :syllabus_list, :batch_list]

  # GET /courses
  # GET /courses.json
  def index
    @courses = @department.courses
    @course = Course.new
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.js { render :update_courses_table }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to department_courses_url(@course.department), notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def term_list
    @term_structure_entries = @course.term_structure_entries
    respond_to do |format|
      format.js
    end
  end

  def syllabus_list
    @syllabuses = @course.syllabuses
    respond_to do |format|
      format.js
    end
  end

  def batch_list
    @batches = @course.batches
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:department_id])
    end

    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_type_id, :name, :code, :term_structure_id, :credit_system)
    end
end

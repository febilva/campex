class SyllabusesController < ApplicationController
  before_action :set_course, except: [:show, :edit, :update, :destroy]
  before_action :set_syllabus, only: [:show, :edit, :update, :destroy]

  # GET /syllabuses
  # GET /syllabuses.json
  def index
    @syllabuses = Syllabus.where(course: @course)
  end

  # GET /syllabuses/1
  # GET /syllabuses/1.json
  def show
    @course = @syllabus.course
  end

  # GET /syllabuses/new
  def new
    @syllabus = Syllabus.new
  end

  # GET /syllabuses/1/edit
  def edit
  end

  # POST /syllabuses
  # POST /syllabuses.json
  def create
    @syllabus = Syllabus.new(syllabus_params)
    @syllabus.course = @course

    respond_to do |format|
      if @syllabus.save
        format.html { redirect_to @syllabus, notice: 'Syllabus was successfully created.' }
        format.json { render :show, status: :created, location: @syllabus }
      else
        format.html { render :new }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /syllabuses/1
  # PATCH/PUT /syllabuses/1.json
  def update
    respond_to do |format|
      if @syllabus.update(syllabus_params)
        format.html { redirect_to @syllabus, notice: 'Syllabus was successfully updated.' }
        format.json { render :show, status: :ok, location: @syllabus }
      else
        format.html { render :edit }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syllabuses/1
  # DELETE /syllabuses/1.json
  def destroy
    @syllabus.destroy
    respond_to do |format|
      format.html { redirect_to course_syllabuses_url(@syllabus.course), notice: 'Syllabus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find_by_id(params[:course_id]) or @syllabus.course
    end

    def set_syllabus
      @syllabus = Syllabus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def syllabus_params
      params.require(:syllabus).permit(:course_id, :term_structure_entry_id, :name)
    end
end

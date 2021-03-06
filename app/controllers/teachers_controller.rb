class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy, :assign_papers, :period_list]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new(user: User.new)
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user.username = @teacher.employee_no
    @teacher.user.password = "password123"
    @teacher.user.roles << Role.where(name: 'Teacher').first

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        @teacher.user.username = @teacher.employee_no
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_papers
    @paper_assignment = PaperAssignment.new 
    @paper_assignments = PaperAssignment.where(teacher: @teacher)
  end

  def period_list
    batch_id = params[:batch_id]
    date = params[:date].to_date

    timetable_entries = Batch.find(batch_id).current_timetable.class_timing.periods.where(is_break: false).pluck(:id)
    
    # timetable_entries = TimetableEntry.joins(:timetable)
    # .where('? BETWEEN start_date AND end_date', date)
    # .where(timetables: {batch_id: batch_id}, timetable_entries: { teacher_id: @teacher.id, wday: date.wday })
    # .select(:period_id).pluck(:period_id)

    marked_periods = StudentAttendanceRegister.joins(:paper)
    .where(batch_id: batch_id, marked_date: date, papers: { optional: false })
    .select(:period_id).pluck(:period_id)
    
    #marked_periods = StudentAttendanceRegister.where(batch_id: batch_id, user_id: current_user.id, 
    #  period_id: timetable_entries, marked_date: date)
    #  .select(:period_id).pluck(:period_id)

    @periods = Period.where(id: timetable_entries - marked_periods)
    @papers = Paper.where(id: PaperAssignment.where(teacher: current_user.profile, batch_id: batch_id).pluck(:paper_id))
  end
  
  def paper_list
    batch_id = params[:batch_id]
    @papers = Paper.where(id: PaperAssignment.where(teacher: current_user.profile, batch_id: batch_id).pluck(:paper_id))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:department_id, :designation_id, :employee_no,
        user_attributes: [:id, :first_name, :middle_name, :last_name, :email, :dob, :nationality_id, :gender, 
          :blood_group, :religion, :mobile_no, :phone_no, :address_line1, :address_line2, :country_id, 
          :state_id, :district_id, :taluk, :post_office, :pincode, :comm_address_line1, :comm_address_line2, 
          :comm_country_id, :comm_state_id, :comm_district_id, :comm_taluk, :comm_post_office, :comm_pincode, 
          :dp])
    end

    def paper_assignment_params
      params.require(:paper_assignment).permit(:batch_id, :paper_id)
    end
end

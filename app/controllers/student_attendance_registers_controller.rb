class StudentAttendanceRegistersController < ApplicationController
  before_action :set_student_attendance_register, only: [:show, :edit, :update, :destroy]

  # GET /student_attendance_registers
  # GET /student_attendance_registers.json
  def index
    @student_attendance_registers = StudentAttendanceRegister.where(user: current_user)
  end

  # GET /student_attendance_registers/1
  # GET /student_attendance_registers/1.json
  def show
  end

  # GET /student_attendance_registers/new
  def new
    @date = Date.today
    
    batches = PaperAssignment.where(teacher: current_user.profile).pluck(:batch_id).uniq.sort

    #batches = Timetable.joins(:timetable_entries)
    #.where(timetable_entries: { teacher_id: current_user.profile.id, wday: @date.wday })
    #.select(:batch_id).uniq.pluck(:batch_id)
    @batches = Batch.where(id: batches)

    @student_attendance_register = StudentAttendanceRegister.new
  end

  # GET /student_attendance_registers/1/edit
  def edit
  end

  # POST /student_attendance_registers
  # POST /student_attendance_registers.json
  def create
    @student_attendance_register = StudentAttendanceRegister.new(student_attendance_register_params)
    @student_attendance_register.user = current_user

    respond_to do |format|
      if @student_attendance_register.save
        params[:student_id].each do |student_id|
          Absence.new(student_attendance_register: @student_attendance_register,
           absentee: Student.find(student_id), leave_type: params["leave_type_#{student_id}"],
            reason: params["absence_reason_#{student_id}"]).save
        end
        format.html { redirect_to @student_attendance_register, notice: 'Student attendance register was successfully created.' }
        format.json { render :show, status: :created, location: @student_attendance_register }
      else
        format.html { render :new }
        format.json { render json: @student_attendance_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_attendance_registers/1
  # PATCH/PUT /student_attendance_registers/1.json
  def update
    respond_to do |format|
      if @student_attendance_register.update(student_attendance_register_params)
        format.html { redirect_to @student_attendance_register, notice: 'Student attendance register was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_attendance_register }
      else
        format.html { render :edit }
        format.json { render json: @student_attendance_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_attendance_registers/1
  # DELETE /student_attendance_registers/1.json
  def destroy
    @student_attendance_register.destroy
    respond_to do |format|
      format.html { redirect_to student_attendance_registers_url, notice: 'Student attendance register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def paperwise_report
    batches = PaperAssignment.where(teacher: current_user.profile).pluck(:batch_id).uniq.sort
    @batches = Batch.where(id: batches)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_attendance_register
      @student_attendance_register = StudentAttendanceRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_attendance_register_params
      params.require(:student_attendance_register).permit(:batch_id, :teacher_id, :paper_id, :period_id, :marked_date)
    end
end

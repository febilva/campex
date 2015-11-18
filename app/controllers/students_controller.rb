class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new(user: User.new)
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @student.user.username = @student.admission_no
    @student.user.password = "password123"
    @student.user.roles << Role.where(name: 'Student').first

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      @student.user.username = @student.admission_no
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:id, :batch_id, :admission_no, :roll_no, 
        user_attributes: [:id, :first_name, :middle_name, :last_name, :email, :dob, :nationality_id, :gender, 
          :blood_group, :religion, :mobile_no, :phone_no, :address_line1, :address_line2, :country_id, 
          :state_id, :district_id, :taluk, :post_office, :pincode, :comm_address_line1, :comm_address_line2, 
          :comm_country_id, :comm_state_id, :comm_district_id, :comm_taluk, :comm_post_office, :comm_pincode, 
          :dp])
    end
end

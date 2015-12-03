class PaperAssignmentsController < ApplicationController
  before_action :set_paper_assignment, only: [:show, :edit, :update, :destroy]

  # GET /paper_assignments
  # GET /paper_assignments.json
  def index
    @paper_assignments = PaperAssignment.all
  end

  # GET /paper_assignments/1
  # GET /paper_assignments/1.json
  def show
  end

  # GET /paper_assignments/new
  def new
    @paper_assignment = PaperAssignment.new
  end

  # GET /paper_assignments/1/edit
  def edit
  end

  # POST /paper_assignments
  # POST /paper_assignments.json
  def create
    @paper_assignment = PaperAssignment.new(paper_assignment_params)

    respond_to do |format|
      if @paper_assignment.save
        format.html { redirect_to @paper_assignment, notice: 'Paper assignment was successfully created.' }
        format.js { render :update_programmes_table }
        format.json { render :show, status: :created, location: @paper_assignment }
      else
        format.html { render :new }
        format.json { render json: @paper_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paper_assignments/1
  # PATCH/PUT /paper_assignments/1.json
  def update
    respond_to do |format|
      if @paper_assignment.update(paper_assignment_params)
        format.html { redirect_to @paper_assignment, notice: 'Paper assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper_assignment }
      else
        format.html { render :edit }
        format.json { render json: @paper_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paper_assignments/1
  # DELETE /paper_assignments/1.json
  def destroy
    @paper_assignment.destroy
    respond_to do |format|
      format.html { redirect_to paper_assignments_url, notice: 'Paper assignment was successfully destroyed.' }
      format.js { render nothing: true }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper_assignment
      @paper_assignment = PaperAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_assignment_params
      params.require(:paper_assignment).permit(:teacher_id, :paper_id, :batch_id)
    end
end

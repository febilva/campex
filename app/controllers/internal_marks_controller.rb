class InternalMarksController < ApplicationController
  before_action :set_batch, except: [:show, :edit, :update, :destroy]
  before_action :set_term, only: [:new, :create, :show, :edit, :update, :destroy]

  # GET /internal_marks
  # GET /internal_marks.json
  def index
    @internal_marks = InternalMark.all
  end

  # GET /internal_marks/1
  # GET /internal_marks/1.json
  def show
  end

  # GET /internal_marks/new
  def new
    @papers = @batch.papers(@term)
    @students = @batch.students.order(:roll_no)
  end

  # GET /internal_marks/1/edit
  def edit
  end

  # POST /internal_marks
  # POST /internal_marks.json
  def create
    created_by = current_user
    internal_mark_params.each do |internal_mark_info|
      if internal_mark_info[1]["marks"].present?
        student_id = internal_mark_info[1]["student_id"].to_i
        internal_mark_info[1]["marks"].each do |mark_info| 
          paper_id = mark_info[1][:paper_id].to_i
          mark = mark_info[1][:mark].to_f
          InternalMark.new(student_id: student_id, term_structure_entry: @term, paper_id: paper_id,
           mark: mark, created_by: created_by).save unless mark_info[1][:mark].empty?
        end
      end
    end
    redirect_to course_batches_path(@batch.course), notice: 'Internal mark was successfully created.'
  end

  # PATCH/PUT /internal_marks/1
  # PATCH/PUT /internal_marks/1.json
  def update
    respond_to do |format|
      if @internal_mark.update(internal_mark_params)
        format.html { redirect_to @internal_mark, notice: 'Internal mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @internal_mark }
      else
        format.html { render :edit }
        format.json { render json: @internal_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_marks/1
  # DELETE /internal_marks/1.json
  def destroy
    @internal_mark.destroy
    respond_to do |format|
      format.html { redirect_to internal_marks_url, notice: 'Internal mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:batch_id])
    end

    def set_term
      @term = TermStructureEntry.find(params[:term_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_mark_params
      params.require(:internal_marks).permit!
    end
end

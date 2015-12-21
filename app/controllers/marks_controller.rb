class MarksController < ApplicationController
  before_action :set_examination, except: [:show, :edit, :update, :destroy]
  before_action :set_mark, only: [:show, :edit, :update, :destroy]

  # GET /marks
  # GET /marks.json
  def index
    @marks = Mark.all
  end

  # GET /marks/1
  # GET /marks/1.json
  def show
  end

  # GET /marks/new
  def new
  end

  # GET /marks/1/edit
  def edit
  end

  # POST /marks
  # POST /marks.json
  def create
    created_by = current_user
    external_mark_params.each do |mark_info|
      Mark.new(registered_exam_paper_id: mark_info[1]["registered_exam_paper_id"], 
        mark: mark_info[1]["mark"], entered_by: created_by).save unless mark_info[1]["mark"].empty?
    end
    redirect_to examination_path(@examination), notice: 'Internal mark was successfully created.'
  end

  # PATCH/PUT /marks/1
  # PATCH/PUT /marks/1.json
  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.html { redirect_to @mark, notice: 'Mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1
  # DELETE /marks/1.json
  def destroy
    @mark.destroy
    respond_to do |format|
      format.html { redirect_to marks_url, notice: 'Mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_examination
      @examination = Examination.find(params[:examination_id])
    end

    def set_mark
      @mark = Mark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mark_params
      params.require(:mark).permit(:registered_exam_paper_id, :mark, :entered_by)
    end

    def external_mark_params
      params.require(:marks).permit!
    end
end

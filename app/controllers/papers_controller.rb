class PapersController < ApplicationController
  before_action :set_syllabus, except: [:show, :edit, :update, :destroy]
  before_action :set_paper, only: [:show, :edit, :update, :destroy]

  # GET /papers
  # GET /papers.json
  def index
    @term_structure_entry = TermStructureEntry.find(params[:term_id])
    @papers = Paper.where(syllabus: @syllabus, term_structure_entry: @term_structure_entry)
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = Paper.new(paper_params)
    @paper.syllabus = @syllabus

    respond_to do |format|
      if @paper.save
        format.html { redirect_to @paper, notice: 'Paper was successfully created.' }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papers/1
  # PATCH/PUT /papers/1.json
  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to @paper, notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to syllabus_papers_url(@paper.syllabus, term_id: @paper.term_structure_entry.id), notice: 'Paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_syllabus
      @syllabus = Syllabus.find(params[:syllabus_id])
    end

    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params
      params.require(:paper).permit(:syllabus_id, :term_structure_entry_id, :paper_type_id, :offered_by_id, :name, :code, :study_mode, :optional, :exam_required)
    end
end

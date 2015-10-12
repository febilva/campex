class TermStructuresController < ApplicationController
  before_action :set_term_structure, only: [:show, :edit, :update, :destroy]

  # GET /term_structures
  # GET /term_structures.json
  def index
    @term_structures = TermStructure.all
  end

  # GET /term_structures/1
  # GET /term_structures/1.json
  def show
  end

  # GET /term_structures/new
  def new
    @term_structure = TermStructure.new
  end

  # GET /term_structures/1/edit
  def edit
  end

  # POST /term_structures
  # POST /term_structures.json
  def create
    @term_structure = TermStructure.new(term_structure_params)

    respond_to do |format|
      if @term_structure.save
        format.html { redirect_to @term_structure, notice: 'Term structure was successfully created.' }
        format.json { render :show, status: :created, location: @term_structure }
      else
        format.html { render :new }
        format.json { render json: @term_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /term_structures/1
  # PATCH/PUT /term_structures/1.json
  def update
    respond_to do |format|
      if @term_structure.update(term_structure_params)
        format.html { redirect_to @term_structure, notice: 'Term structure was successfully updated.' }
        format.json { render :show, status: :ok, location: @term_structure }
      else
        format.html { render :edit }
        format.json { render json: @term_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /term_structures/1
  # DELETE /term_structures/1.json
  def destroy
    @term_structure.destroy
    respond_to do |format|
      format.html { redirect_to term_structures_url, notice: 'Term structure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_term_structure
      @term_structure = TermStructure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def term_structure_params
      params.require(:term_structure).permit(:name)
    end
end

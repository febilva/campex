class TermStructureEntriesController < ApplicationController
  before_action :set_term_structure_entry, only: [:show, :edit, :update, :destroy]

  # GET /term_structure_entries
  # GET /term_structure_entries.json
  def index
    @term_structure_entries = TermStructureEntry.all
  end

  # GET /term_structure_entries/1
  # GET /term_structure_entries/1.json
  def show
  end

  # GET /term_structure_entries/new
  def new
    @term_structure_entry = TermStructureEntry.new
  end

  # GET /term_structure_entries/1/edit
  def edit
  end

  # POST /term_structure_entries
  # POST /term_structure_entries.json
  def create
    @term_structure_entry = TermStructureEntry.new(term_structure_entry_params)

    respond_to do |format|
      if @term_structure_entry.save
        format.html { redirect_to @term_structure_entry, notice: 'Term structure entry was successfully created.' }
        format.json { render :show, status: :created, location: @term_structure_entry }
      else
        format.html { render :new }
        format.json { render json: @term_structure_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /term_structure_entries/1
  # PATCH/PUT /term_structure_entries/1.json
  def update
    respond_to do |format|
      if @term_structure_entry.update(term_structure_entry_params)
        format.html { redirect_to @term_structure_entry, notice: 'Term structure entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @term_structure_entry }
      else
        format.html { render :edit }
        format.json { render json: @term_structure_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /term_structure_entries/1
  # DELETE /term_structure_entries/1.json
  def destroy
    @term_structure_entry.destroy
    respond_to do |format|
      format.html { redirect_to term_structure_entries_url, notice: 'Term structure entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_term_structure_entry
      @term_structure_entry = TermStructureEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def term_structure_entry_params
      params.require(:term_structure_entry).permit(:term_structure_id, :name, :code)
    end
end

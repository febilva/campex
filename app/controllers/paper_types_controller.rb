class PaperTypesController < ApplicationController
  before_action :set_paper_type, only: [:show, :edit, :update, :destroy]

  # GET /paper_types
  # GET /paper_types.json
  def index
    @paper_types = PaperType.all
  end

  # GET /paper_types/1
  # GET /paper_types/1.json
  def show
  end

  # GET /paper_types/new
  def new
    @paper_type = PaperType.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /paper_types/1/edit
  def edit
  end

  # POST /paper_types
  # POST /paper_types.json
  def create
    @paper_type = PaperType.new(paper_type_params)

    respond_to do |format|
      if @paper_type.save
        format.html { redirect_to @paper_type, notice: 'Paper type was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @paper_type }
      else
        format.html { render :new }
        format.json { render json: @paper_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paper_types/1
  # PATCH/PUT /paper_types/1.json
  def update
    respond_to do |format|
      if @paper_type.update(paper_type_params)
        format.html { redirect_to @paper_type, notice: 'Paper type was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper_type }
      else
        format.html { render :edit }
        format.json { render json: @paper_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paper_types/1
  # DELETE /paper_types/1.json
  def destroy
    @paper_type.destroy
    respond_to do |format|
      format.html { redirect_to paper_types_url, notice: 'Paper type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper_type
      @paper_type = PaperType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_type_params
      params.require(:paper_type).permit(:name, :code)
    end
end

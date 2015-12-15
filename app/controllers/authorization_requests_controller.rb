class AuthorizationRequestsController < ApplicationController
  before_action :set_authorization_request, only: [:show, :edit, :update, :destroy]

  # GET /authorization_requests
  # GET /authorization_requests.json
  def index
    @authorization_requests = AuthorizationRequest.all
  end

  # GET /authorization_requests/1
  # GET /authorization_requests/1.json
  def show
  end

  # GET /authorization_requests/new
  def new
    @authorization_request = AuthorizationRequest.new
  end

  # GET /authorization_requests/1/edit
  def edit
  end

  # POST /authorization_requests
  # POST /authorization_requests.json
  def create
    @authorization_request = AuthorizationRequest.new(authorization_request_params)
    @authorization_request.request_user = current_user

    respond_to do |format|
      if @authorization_request.save
        format.html { redirect_to @authorization_request, notice: 'Authorization request was successfully created.' }
        format.json { render :show, status: :created, location: @authorization_request }
      else
        format.html { render :new }
        format.json { render json: @authorization_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authorization_requests/1
  # PATCH/PUT /authorization_requests/1.json
  def update
    respond_to do |format|
      if @authorization_request.update(authorization_request_params)
        format.html { redirect_to @authorization_request, notice: 'Authorization request was successfully updated.' }
        format.json { render :show, status: :ok, location: @authorization_request }
      else
        format.html { render :edit }
        format.json { render json: @authorization_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authorization_requests/1
  # DELETE /authorization_requests/1.json
  def destroy
    @authorization_request.destroy
    respond_to do |format|
      format.html { redirect_to authorization_requests_url, notice: 'Authorization request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_attendance_date
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorization_request
      @authorization_request = AuthorizationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authorization_request_params
      params.require(:authorization_request).permit(:request_type, :request_params, :request_remarks, :approval_date, :approval_remarks, :status)
    end
end

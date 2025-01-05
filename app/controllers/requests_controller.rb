class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy rate ]

  # GET /requests or /requests.json
  def index
    # @requests = Request.all
    @request_received = Request.where(receiver_id: current_user.id)
    @request_sent = Request.where(sender_id: current_user.id)
  end

  # GET /requests/1 or /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    publication = Publication.find params[:publication_id]
    @request = Request.new(receiver_id: publication.user_id, sender_id: current_user.id, publication_id: publication.id)
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: "Request was successfully created." }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: "Request was successfully updated." }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy!

    respond_to do |format|
      format.html { redirect_to requests_path, status: :see_other, notice: "Request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def rate
    if @request.update(rating: params[:request][:rating])
      redirect_to @request, notice: "Request was successfully rated."
    else
      render :show, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.expect(request: [ :title, :description, :contact, :picture, :sender_id, :receiver_id, :publication_id, :status, :rating ])
    end
end

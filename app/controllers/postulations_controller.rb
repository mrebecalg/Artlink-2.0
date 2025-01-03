class PostulationsController < ApplicationController
  before_action :set_postulation, only: %i[ show edit update destroy ]

  # GET /postulations or /postulations.json
  def index
    # @postulations = Postulation.all
    @postulation_received = Postulation.where(receiver_id: 0)
    @postulation_sent = Postulation.where(sender_id: current_user.id)
  end

  # GET /postulations/1 or /postulations/1.json
  def show
  end

  # GET /postulations/new
  def new
    # Redirigir si el usuario ya tiene una postulación
    if current_user.sent_postulation.present?
      redirect_to postulation_path(current_user.sent_postulation), alert: "You have already submitted a postulation"
    else
      @postulation = Postulation.new(sender_id: current_user.id)
    end
  end

  # GET /postulations/1/edit
  def edit
  end

  # POST /postulations or /postulations.json
  def create
    if current_user.sent_postulation.present?
      redirect_to postulation_path(current_user.sent_postulation), alert: "You have already submitted a postulation."
    else
      @postulation = Postulation.new(postulation_params)
      respond_to do |format|
        if @postulation.save
          format.html { redirect_to @postulation, notice: "Postulation was successfully created." }
          format.json { render :show, status: :created, location: @postulation }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @postulation.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /postulations/1 or /postulations/1.json
  def update
    respond_to do |format|
      if @postulation.update(postulation_params)
        if @postulation.status == "Aceptado"
          @postulation.sender.update(access: 2)
        end
        format.html { redirect_to @postulation, notice: "Postulation was successfully updated." }
        format.json { render :show, status: :ok, location: @postulation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulations/1 or /postulations/1.json
  def destroy
    @postulation.destroy!

    respond_to do |format|
      format.html { redirect_to postulations_path, status: :see_other, notice: "Postulation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulation
      @postulation = Postulation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def postulation_params
      params.expect(postulation: [ :title, :content, :portfolio, :sender_id, :receiver_id, :status, :username ])
    end
end

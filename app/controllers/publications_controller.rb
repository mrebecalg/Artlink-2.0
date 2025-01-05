class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[ show edit update destroy ]

  # GET /publications or /publications.json
  def index
    # @publications = Publication.all
    if params[:search]
      @publications = Publication.joins(:user).where("lower(publications.name) LIKE ? OR lower(users.username) LIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
    else
      @publications = Publication.all
    end
  end

  # GET /publications/1 or /publications/1.json
  def show
    @publication = Publication.find(params[:id])
    @average_rating = @publication.average_rating
  end
  
  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications or /publications.json
  def create
    @publication = current_user.publications.build(publication_params)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1 or /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1 or /publications/1.json
  def destroy
    @publication.destroy!

    respond_to do |format|
      format.html { redirect_to publications_path, status: :see_other, notice: "Publication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def publication_params
      params.expect(publication: [ :name, :description, :picture, :price ])
    end
end

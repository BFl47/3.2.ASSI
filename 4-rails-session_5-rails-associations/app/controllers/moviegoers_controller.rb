class MoviegoersController < ApplicationController
  before_action :set_moviegoer, only: %i[ show edit update destroy ]

  # GET /moviegoers or /moviegoers.json
  def index
    @moviegoers = Moviegoer.all
  end

  # GET /moviegoers/1 or /moviegoers/1.json
  def show
  end

  # GET /moviegoers/new
  def new
    @moviegoer = Moviegoer.new
  end

  # GET /moviegoers/1/edit
  def edit
  end

  # POST /moviegoers or /moviegoers.json
  def create
    @moviegoer = Moviegoer.new(moviegoer_params)

    respond_to do |format|
      if @moviegoer.save
        format.html { redirect_to moviegoer_url(@moviegoer), notice: "Moviegoer was successfully created." }
        format.json { render :show, status: :created, location: @moviegoer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @moviegoer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moviegoers/1 or /moviegoers/1.json
  def update
    respond_to do |format|
      if @moviegoer.update(moviegoer_params)
        format.html { redirect_to moviegoer_url(@moviegoer), notice: "Moviegoer was successfully updated." }
        format.json { render :show, status: :ok, location: @moviegoer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @moviegoer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moviegoers/1 or /moviegoers/1.json
  def destroy
    @moviegoer.destroy

    respond_to do |format|
      format.html { redirect_to moviegoers_url, notice: "Moviegoer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moviegoer
      @moviegoer = Moviegoer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def moviegoer_params
      params.require(:moviegoer).permit(:uid, :name)
    end
end

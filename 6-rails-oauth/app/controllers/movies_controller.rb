class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  def index_naive_implementation
    if (params[:sort_order] != nil)
      case params[:sort_order]
      when 'title'
        @movies = Movie.all.order(:title)
      when 'release_date'
        @movies = Movie.all.order(:release_date)
      end
    else
      @movies = Movie.all
    end
  end

  # GET /movies or /movies.json
  def index
    base = Movie
  
    sort_order = params[:sort_order] || session[:sort_order]
    unless sort_order.nil?
      case sort_order
      when 'title', 'release_date'
        base = base.order(sort_order)
      end
    end

    @all_ratings = Movie.all_ratings
    @selected_ratings = @all_ratings

    ratings = params[:ratings].nil? ? session[:ratings] : params[:ratings].keys
    unless ratings.nil?
      @selected_ratings = ratings
      base = base.where(rating: @selected_ratings)
    end

    @movies = base.all
    @linkto_ratings = Hash[@selected_ratings.map { |rating| [rating, 1] }]

    session[:sort_order] = sort_order
    session[:ratings] = ratings
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
end

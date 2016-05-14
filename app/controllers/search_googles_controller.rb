#Scraper Google
class SearchGooglesController < ApplicationController
  before_action :set_search_google, only: [:show, :edit, :update, :destroy]

  # GET /search_googles
  # GET /search_googles.json
  def index
    @search_googles = SearchGoogle.all
    
    term_date = Date.parse((Date.today - 5).to_s)
    
    while term_date < (Date.today)
      google_url = "http://rank.ezme.net/?mode=recmd" + "3" + "&day=" + term_date.to_s

      google_crawler = SES.new("google", term_date)

      google_crawler.Scraper(google_url)

      term_date += 1
    end
  end

  # GET /search_googles/1
  # GET /search_googles/1.json
  def show
  end

  # GET /search_googles/new
  def new
    @search_google = SearchGoogle.new
  end

  # GET /search_googles/1/edit
  def edit
  end

  # POST /search_googles
  # POST /search_googles.json
  def create
    @search_google = SearchGoogle.new(search_google_params)

    respond_to do |format|
      if @search_google.save
        format.html { redirect_to @search_google, notice: 'Search google was successfully created.' }
        format.json { render :show, status: :created, location: @search_google }
      else
        format.html { render :new }
        format.json { render json: @search_google.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_googles/1
  # PATCH/PUT /search_googles/1.json
  def update
    respond_to do |format|
      if @search_google.update(search_google_params)
        format.html { redirect_to @search_google, notice: 'Search google was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_google }
      else
        format.html { render :edit }
        format.json { render json: @search_google.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_googles/1
  # DELETE /search_googles/1.json
  def destroy
    @search_google.destroy
    respond_to do |format|
      format.html { redirect_to search_googles_url, notice: 'Search google was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_google
      @search_google = SearchGoogle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_google_params
      params.require(:search_google).permit(:issue_title, :issue_rank, :issue_today_total, :issue_date, :issue_time)
    end
end

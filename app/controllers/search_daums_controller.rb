#Scraper Daum
class SearchDaumsController < ApplicationController
  before_action :set_search_daum, only: [:show, :edit, :update, :destroy]

  # GET /search_daums
  # GET /search_daums.json
  def index
    @search_daums = SearchDaum.all
    
    term_date = Date.parse((Date.today - 5).to_s)
    
    while term_date < (Date.today)
      daum_url = "http://rank.ezme.net/?mode=recmd" + "1" + "&day=" + term_date.to_s

      daum_crawler = SES.new("daum", term_date)

      daum_crawler.Scraper(daum_url)

      term_date += 1
    end
  end

  # GET /search_daums/1
  # GET /search_daums/1.json
  def show
  end

  # GET /search_daums/new
  def new
    @search_daum = SearchDaum.new
  end

  # GET /search_daums/1/edit
  def edit
  end

  # POST /search_daums
  # POST /search_daums.json
  def create
    @search_daum = SearchDaum.new(search_daum_params)

    respond_to do |format|
      if @search_daum.save
        format.html { redirect_to @search_daum, notice: 'Search daum was successfully created.' }
        format.json { render :show, status: :created, location: @search_daum }
      else
        format.html { render :new }
        format.json { render json: @search_daum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_daums/1
  # PATCH/PUT /search_daums/1.json
  def update
    respond_to do |format|
      if @search_daum.update(search_daum_params)
        format.html { redirect_to @search_daum, notice: 'Search daum was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_daum }
      else
        format.html { render :edit }
        format.json { render json: @search_daum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_daums/1
  # DELETE /search_daums/1.json
  def destroy
    @search_daum.destroy
    respond_to do |format|
      format.html { redirect_to search_daums_url, notice: 'Search daum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_daum
      @search_daum = SearchDaum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_daum_params
      params.require(:search_daum).permit(:issue_title, :issue_rank, :issue_today_total, :issue_date, :issue_time)
    end
end

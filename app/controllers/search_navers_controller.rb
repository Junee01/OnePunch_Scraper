#Scraper Naver
class SearchNaversController < ApplicationController
  before_action :set_search_naver, only: [:show, :edit, :update, :destroy]

  # GET /search_navers
  # GET /search_navers.json
  def index
    @search_navers = SearchNaver.all

    term_date = Date.parse((Date.today - 5).to_s)

    while term_date < (Date.today)
      naver_url = "http://rank.ezme.net/?mode=recmd" + "2" + "&day=" + term_date.to_s

      naver_crawler = SES.new("naver", term_date)

      naver_crawler.Scraper(naver_url)

      term_date += 1
    end
  end

  # GET /search_navers/1
  # GET /search_navers/1.json
  def show
  end

  # GET /search_navers/new
  def new
    @search_naver = SearchNaver.new
  end

  # GET /search_navers/1/edit
  def edit
  end

  # POST /search_navers
  # POST /search_navers.json
  def create
    @search_naver = SearchNaver.new(search_naver_params)

    respond_to do |format|
      if @search_naver.save
        format.html { redirect_to @search_naver, notice: 'Search naver was successfully created.' }
        format.json { render :show, status: :created, location: @search_naver }
      else
        format.html { render :new }
        format.json { render json: @search_naver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_navers/1
  # PATCH/PUT /search_navers/1.json
  def update
    respond_to do |format|
      if @search_naver.update(search_naver_params)
        format.html { redirect_to @search_naver, notice: 'Search naver was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_naver }
      else
        format.html { render :edit }
        format.json { render json: @search_naver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_navers/1
  # DELETE /search_navers/1.json
  def destroy
    @search_naver.destroy
    respond_to do |format|
      format.html { redirect_to search_navers_url, notice: 'Search naver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_naver
      @search_naver = SearchNaver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_naver_params
      params.require(:search_naver).permit(:issue_title, :issue_rank, :issue_today_total, :issue_date, :issue_time)
    end
end

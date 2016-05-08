class IChartsController < ApplicationController
  before_action :set_i_chart, only: [:show, :edit, :update, :destroy]

  # GET /i_charts
  # GET /i_charts.json
  def index
    @i_charts = IChart.all
    
    #여기 주석을 풀면, 다시 수행.
    # iChart_url = "http://www.instiz.net/iframe_ichart_score.htm?real=1"

    # #This part is for UTF ENCODING PROBLEM
    # agent = Mechanize.new
    # page = agent.get iChart_url
    # data_by_nokogiri = Nokogiri::HTML(page.content)

    # @first = data_by_nokogiri.css('body div.spage_intistore_body div#score_1st')

    # IChart.create(
    #   :iChart_rank => 1,
    #   :iChart_song => @first.css('div.ichart_score_song div.ichart_score_song1').text.strip,
    #   :iChart_album => @first.css('div.ichart_score_song div.ichart_score_song2 span a').text.strip,
    #   :iChart_artist => @first.css('div.ichart_score_artist div.ichart_score_artist1').text.strip,
    #   :iChart_etm => @first.css('div.ichart_score_artist div.ichart_score_artist2 span').text.strip
    # )

    # @second = data_by_nokogiri.css('body div.spage_intistore_body div.spage_score_bottom div.spage_score_item')

    # @counter = 2

    # @second.each do |part|
    #   IChart.create(
    #     :iChart_rank => @counter,
    #     :iChart_song => part.css('div.ichart_score2_song div.ichart_score2_song1').text.strip,
    #     :iChart_album => part.css('div.ichart_score2_song div.ichart_score2_song2 span a').text.strip,
    #     :iChart_artist => part.css('div.ichart_score2_artist div.ichart_score2_artist1').text.strip,
    #     :iChart_etm => part.css('div.ichart_score2_artist div.ichart_score2_artist2').text.strip
    #   ) 
    #   @counter += 1
    # end
  end

  # GET /i_charts/1
  # GET /i_charts/1.json
  def show
  end

  # GET /i_charts/new
  def new
    @i_chart = IChart.new
  end

  # GET /i_charts/1/edit
  def edit
  end

  # POST /i_charts
  # POST /i_charts.json
  def create
    @i_chart = IChart.new(i_chart_params)

    respond_to do |format|
      if @i_chart.save
        format.html { redirect_to @i_chart, notice: 'I chart was successfully created.' }
        format.json { render :show, status: :created, location: @i_chart }
      else
        format.html { render :new }
        format.json { render json: @i_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /i_charts/1
  # PATCH/PUT /i_charts/1.json
  def update
    respond_to do |format|
      if @i_chart.update(i_chart_params)
        format.html { redirect_to @i_chart, notice: 'I chart was successfully updated.' }
        format.json { render :show, status: :ok, location: @i_chart }
      else
        format.html { render :edit }
        format.json { render json: @i_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /i_charts/1
  # DELETE /i_charts/1.json
  def destroy
    @i_chart.destroy
    respond_to do |format|
      format.html { redirect_to i_charts_url, notice: 'I chart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_i_chart
      @i_chart = IChart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def i_chart_params
      params.require(:i_chart).permit(:iChart_rank, :iChart_artist, :iChart_song, :iChart_album, :iChart_etm)
    end
end

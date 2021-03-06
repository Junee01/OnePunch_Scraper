#Exchange all datas
class Exchange
	def initialize
	end

	def Exchanger(keywords,strdate,enddate)
		@keywords = keywords.split(',')
		@tscore = 0
		#For each objects search tuples including strings left side & right side. %string% format in LIKE QUERY
		@keywords.each do | keyword |
			@tmp1 = SearchNaver.where("issue_title LIKE ?", ("%"+keyword+"%")).where("issue_date between ? and ? ", DateTime.parse(strdate), DateTime.parse(enddate))
			@tmp2 = SearchDaum.where("issue_title LIKE ?", ("%"+keyword+"%")).where("issue_date between ? and ? ", DateTime.parse(strdate), DateTime.parse(enddate))
			@tmp3 = SearchGoogle.where("issue_title LIKE ?", ("%"+keyword+"%")).where("issue_date between ? and ? ", DateTime.parse(strdate), DateTime.parse(enddate))

			#Naver : Daum : Google = 3 : 1 : 1
			@tscore = Exchanger_loop(@tmp1, @tscore) * 3
	    	@tscore = Exchanger_loop(@tmp2, @tscore)
	    	@tscore = Exchanger_loop(@tmp3, @tscore)
		end
		#iChart Part with LIKE QUERY, Now's Data
		@keywords.each do | keyword |
		 	@tmp4 = IChart.where("iChart_artist LIKE ?", ("%"+keyword+"%"))
		 	@tscore = Exchanger_loop_for_ichart(@tmp4, @tscore)
		end

	    Artist.where(artist_name: @keywords[0]).first.update_attribute(:artist_score, (Artist.where(artist_name: @keywords[0]).first.artist_score + @tscore))
	end

	#Exchange by search engine data
	def Exchanger_loop(tmp, tscore)
		tmp.each do |t|
	      case t.issue_rank
	      when 1
	        tscore += 10
	      when 2..4
	        tscore += 1
	      when 5..7
	        tscore += 0.1
	      when 8..10
	        tscore += 0.01
	      else
	      	next
	      end 
	    end
	   	tscore
	end

	#Exchange by ichart
	def Exchanger_loop_for_ichart(tmp, tscore)
		tmp.each do |t|
	      case t.iChart_rank
	      when 1
	        tscore += 100
	      when 2..10
	        tscore += 10
	      when 11..20
	        tscore += 1
	      when 21..30
	        tscore += 0.1
	      when 31..50
	        tscore += 0.01
	      else
	      	next
	      end 
	    end
	   	tscore
	end
end
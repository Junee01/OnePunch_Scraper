#Search Engine Scraper
class SES
	def initialize(from, iwhen)
		@from = from
		@iwhen = iwhen.to_s
	end

	def Scraper(url)
		@url = url

		data = Nokogiri::HTML(open(@url))
    
	    #Scraper Function Begin
	    @rank_counter = 1  #rank counter
	    @clock_counter = 1  #clock counter + 2 from 1 or 13 because first tbody starts from 1 and the second one is 13
	    @check = 0  #check if tbody [0] or [1]
	    
	    @firstformat = data.css('div.row-fluid')[1].css('tbody')

	    @firstformat.each do |tbody|
	      tbody.css('tr').each do |tr|
	        tr.css('td').each do |td|
	        	case @from
	        	when /daum/
		          SearchDaum.create(
		            :issue_title => td.text[0..-3], #get String except last 2 chars
		            :issue_rank => @rank_counter, #get rank
		            :issue_today_total => td.text[-1,1],  #get String only last 1 char
		            :issue_date => Date.parse(@iwhen),  #get Date today
		            :issue_time => @clock_counter #get time that the issue was issued
		            )
		        when /naver/
         		  SearchNaver.create(
					:issue_title => td.text[0..-3], #get String except last 2 chars
		            :issue_rank => @rank_counter, #get rank
		            :issue_today_total => td.text[-1,1],  #get String only last 1 char
		            :issue_date => Date.parse(@iwhen),  #get Date today
		            :issue_time => @clock_counter #get time that the issue was issued
		            )
         		when /google/
     		 	  SearchGoogle.create(
		            :issue_title => td.text[0..-3], #get String except last 2 chars
		            :issue_rank => @rank_counter, #get rank
		            :issue_today_total => td.text[-1,1],  #get String only last 1 char
		            :issue_date => Date.parse(@iwhen),  #get Date today
		            :issue_time => @clock_counter #get time that the issue was issued
		            )
     		 	else
     		 	end
	          @clock_counter = @clock_counter + 2
	        end
	        @rank_counter = @rank_counter + 1
	        if @check == 0
	          @clock_counter = 1
	        else
	          @clock_counter = 13
	        end
	      end
	      @rank_counter = 1
	      @clock_counter = 13
	      @check = 1
	    end
	    #Scraper Function End
	end
end
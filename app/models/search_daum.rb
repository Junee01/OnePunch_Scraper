class SearchDaum < ActiveRecord::Base
	#Checking Duplicate by date -> title -> time
	validates :issue_date, :uniqueness => {:scope => [:issue_title, :issue_time]}
end

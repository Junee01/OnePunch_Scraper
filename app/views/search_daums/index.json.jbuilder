json.array!(@search_daums) do |search_daum|
  json.extract! search_daum, :id, :issue_title, :issue_rank, :issue_today_total, :issue_date, :issue_time
  json.url search_daum_url(search_daum, format: :json)
end

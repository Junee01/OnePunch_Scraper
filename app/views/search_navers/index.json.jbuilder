json.array!(@search_navers) do |search_naver|
  json.extract! search_naver, :id, :issue_title, :issue_rank, :issue_today_total, :issue_date, :issue_time
  json.url search_naver_url(search_naver, format: :json)
end

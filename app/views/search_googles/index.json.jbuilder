json.array!(@search_googles) do |search_google|
  json.extract! search_google, :id, :issue_title, :issue_rank, :issue_today_total, :issue_date, :issue_time
  json.url search_google_url(search_google, format: :json)
end

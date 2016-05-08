json.array!(@i_charts) do |i_chart|
  json.extract! i_chart, :id, :iChart_rank, :iChart_artist, :iChart_song, :iChart_album, :iChart_etm
  json.url i_chart_url(i_chart, format: :json)
end

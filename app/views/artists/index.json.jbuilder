json.array!(@artists) do |artist|
  json.extract! artist, :id, :artist_name, :artist_same, :artist_score
  json.url artist_url(artist, format: :json)
end

class Artist < ActiveRecord::Base
	default_scope { order(artist_score: :desc) }
end

class Artist < ActiveRecord::Base
	#스코어가 큰 순서대로 정렬
	default_scope { order(artist_score: :desc) }
end

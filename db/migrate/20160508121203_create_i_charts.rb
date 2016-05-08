class CreateICharts < ActiveRecord::Migration
  def change
    create_table :i_charts do |t|
      t.integer :iChart_rank
      t.string :iChart_artist
      t.string :iChart_song
      t.string :iChart_album
      t.string :iChart_etm

      t.timestamps null: false
    end
  end
end

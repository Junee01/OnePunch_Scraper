class CreateSearchGoogles < ActiveRecord::Migration
  def change
    create_table :search_googles do |t|
      t.string :issue_title
      t.integer :issue_rank
      t.integer :issue_today_total
      t.datetime :issue_date
      t.integer :issue_time

      t.timestamps null: false
    end
  end
end

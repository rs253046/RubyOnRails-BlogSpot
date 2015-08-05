class AddCountsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :counts, :integer
  end
end

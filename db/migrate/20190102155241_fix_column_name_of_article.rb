class FixColumnNameOfArticle < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :updated_ar, :updated_at
  end
end

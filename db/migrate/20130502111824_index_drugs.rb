class IndexDrugs < ActiveRecord::Migration
  COLUMNS = [:name, :label, :usage, :form]
  def up
    COLUMNS.each do |colname|
      execute <<-SQL
        create index idx_ft_#{colname} on drugs using gin(to_tsvector('unaccent_simple', #{colname}));
      SQL
    end
  end

  def down
    COLUMNS.each do |colname|
      execute <<-SQL
        drop index idx_ft_#{colname}
      SQL
    end
  end
end

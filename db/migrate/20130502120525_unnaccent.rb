class Unnaccent < ActiveRecord::Migration
  def up
    execute <<-SQL 
      create extension unaccent;
      create text search configuration unaccent_simple ( copy = simple );
      alter text search configuration unaccent_simple
          alter mapping for hword, hword_part, word
          with unaccent, english_stem;
    SQL
  end

  def down
    execute <<-SQL
      drop text search configuration unaccent_simple
      drop extension unaccent;
    SQL
  end
end

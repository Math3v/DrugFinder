class HomeController < ApplicationController
  def index
  end

  def find_
    conn = PGconn.open(:dbname => 'drugdb')
    drug = conn.exec('SELECT * FROM drugs WHERE name LIKE \'ABROTANUM\'')
  end

  def find
    @drug = Drug.first
  end
end

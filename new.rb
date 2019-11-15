require 'pg'

class New

  def initialize(params)
    @params = params
    return unless valid?

    conn.exec("INSERT INTO New(text) VALUES('#{params[:text]}')")
  end

  def valid?
    @params[:text] != ""
  end

  def self.all
    conn = PG.connect :dbname => 'ruby', :user => 'banan4ik', :password => 'password'
    conn.exec("SELECT * FROM New;").to_a
  end

  def self.by_id(id)
    conn = PG.connect :dbname => 'ruby', :user => 'banan4ik', :password => 'password'
    conn.exec("SELECT * FROM New WHERE id = #{id};").to_a[0]
  end

  def self.delete(id)
    Comment.delete_by_id_news(id)
    conn = PG.connect :dbname => 'ruby', :user => 'banan4ik', :password => 'password'
    conn.exec("DELETE FROM New WHERE id = '#{id}';")
  end

  private

  def conn
    @conn ||= PG.connect :dbname => 'ruby', :user => 'banan4ik', :password => 'password'
  end
end
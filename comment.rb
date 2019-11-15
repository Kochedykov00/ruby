require 'pg'

class Comment

  def initialize(params)
    @params = params
    return unless valid?

    conn.exec("INSERT INTO Comment(text, new) VALUES('#{params[:text]}', #{params[:id]})")

  end

  def valid?
    @params[:text] != ""
  end

  def self.all(id)
    conn = PG.connect :dbname => 'ruby', :user => 'banan4ik', :password => 'password'
    conn.exec("SELECT * FROM Comment WHERE id=#{id};").to_a
  end

 
 def self.delete(id)
    conn = PG.connect :dbname => 'ruby', :user => 'banan4ik', :password => 'password'
    conn.exec("DELETE FROM Comment WHERE id = '#{id}';")
  end

  def self.all_comments_of_new(id)
    conn = PG.connect :dbname => 'ruby_course', :user => 'ruby', :password => 'password'
    conn.exec("SELECT * FROM Comment WHERE id=#{id};").to_a
  end



  def self.delete_by_id_news(id)
    conn = PG.connect :dbname => 'ruby', :user => 'banan4ik', :password => 'password'
    conn.exec("DELETE FROM Comment WHERE id = '#{id}';")
  end

  private

  def conn
    @conn ||= PG.connect :dbname => 'ruby', :user => 'banan4ik', :password => 'password'
  end
end
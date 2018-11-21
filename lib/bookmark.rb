require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, url:, title:)
    @id  = id
    @title = title
    @url = url
  end

  def self.list_of_bookmarks
      result = sql('SELECT * FROM bookmarks;')
      result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])
      end
  end

  def self.delete(name)
    sql("DELETE FROM bookmarks WHERE title = '#{name}'")
  end

  def self.create(url:, title:)
      sql("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
  end

  private

  def self.sql(query)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec(query)
  end
end

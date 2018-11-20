require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    "Bookmark Manager"
  end

  get '/bookmark' do
    @booklist = Bookmark.list_of_bookmarks
    erb(:bookmark)
  end
end
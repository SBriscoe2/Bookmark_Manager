require 'sinatra/base'
require './lib/bookmark'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    "Bookmark Manager"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.list_of_bookmarks
    erb(:"bookmarks/index")
  end

  post '/bookmarks' do
    flash[:notice] = "Not a valid URL" unless Bookmark.create(url: params['url'], title: params[:title])
    redirect('/bookmarks')
  end

  post '/bookmarks/delete' do
    Bookmark.delete(params['bookmark_to_delete'])
    redirect '/bookmarks'
  end

  post '/bookmarks/edit' do
    p "params[:title] = #{params['bookmark_to_edit']} "
    Bookmark.store(params['bookmark_to_edit'])
    redirect 'bookmarks/edit'
  end

  get '/bookmarks/edit' do
    @title = Bookmark.title_return
    p "@title = #{@title}"
    erb(:"bookmarks/edit")
  end

  post '/bookmarks/do_edit' do
    Bookmark.update(params['url'],params['title'])
    redirect('/bookmarks')
  end
end

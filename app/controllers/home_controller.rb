require 'grit'

class HomeController < ApplicationController

  def index
    if not session[:name]
      redirect_to login_url
      return
    end
    repo = Grit::Repo.new("/home/#{session[:name]}")
    @commits = repo.commits
  end

  def diff
    repo    = Grit::Repo.new("/home/#{session[:name]}")
    @commit = repo.commits(params[:id]).first
    @diff   = Grit::Commit.diff(repo, params[:id])
  end

end

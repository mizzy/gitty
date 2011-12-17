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

  def compare
    versions = params[:versions]
    versions = "%s-%s" % [ versions.last, versions.first ]
    redirect_to diff_url(versions)
  end

  def diff
    versions = params[:versions].split(/-/)
    repo    = Grit::Repo.new("/home/#{session[:name]}")
    @diff   = repo.diff(versions.first, versions.last)
  end


end

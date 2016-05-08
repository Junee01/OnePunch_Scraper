require 'mechanize'	#mechanize gem
require 'nokogiri'  #nokogiri gem
require 'open-uri'  #open-uri gem

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

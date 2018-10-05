require 'rubygems'
require 'nokogiri'
require 'open-uri'

class ApiController < ApplicationController

    def alexa_endpoint
        render :json => Ralyxa::Skill.handle(request)
    end

end

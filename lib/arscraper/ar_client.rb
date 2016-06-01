require 'singleton'

require 'mechanize'
require 'library_stdnums'
require 'pry'
module Arscraper

  class InvalidISBNError < StandardError;end

  class ArClient
    include Singleton

    def find(isbn)
      raise InvalidISBNError unless StdNum::ISBN.valid?(isbn)
      # Add agent cookies
      add_cookies
      # set the request headers
      set_headers
      #get the search page
      @search_page = agent.get(url)

      #add the isbn value to the search field
      search_field.value = isbn
      # set some hidden inputs required by the service
      search_day.value   = Time.now.mday
      search_hour.value  = Time.now.hour
      submit_form
    end


    def agent
      @agent ||= ::Mechanize.new
    end

    def add_cookies
      @cookies ||= ::Mechanize::Cookie.new('BFUserType', 'Student')
      @cookies.domain = "www.arfinder.com"
      @cookies
      agent.cookie_jar.add(url, @cookies)
    end

    def search_field
      search_form.field_with(name: "ctl00$ContentPlaceHolder1$txtKeyWords")
    end

    def search_day
      search_form.field_with(name: 'ctl00$clientDateDay')
    end

    def search_hour
      search_form.field_with(name: 'ctl00$clientDateHour')
    end

    def search_page
      @search ||= agent.get(url)
    end

    def search_button
      search_form.button_with(name: 'ctl00$ContentPlaceHolder1$btnDoIt')
    end

    def search_form
      search_page.form('aspnetForm')
    end

    def submit_form
      button = 'ctl00$ContentPlaceHolder1$btnDoIt'
      submit_button = search_form.button_with(name: button)
      search_form.click_button(submit_button)
    end

    def url
      "http://www.arbookfind.com/default.aspx"
    end

    def setup_request
      @agent.cookie_jar.add(url, cookies)
      @agent.request_headers = headers
      @agent
    end

    def set_headers
      agent.request_headers = headers
    end
    def headers
      {
      	"Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
      	"Accept-Encoding" => 'gzip,deflate',
      	"Accept-Language" => "en-US,en;q=0.8",
      	"Cache-Control" => "max-age=0",
      	"Content-Type" => "application/x-www-form-urlencoded",
      	"Cookie" => "ASP.NET_SessionId=udoubquaavsqefvjbl4xmsaf; __utma=167894257.1488996622.1462837797.1462916850.1462990478.4; __utmc=167894257; __utmz=167894257.1462837797.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); BFUserType=Student",
      	"Host" => 'www.arbookfind.com',
      	'Origin' => 'http://www.arbookfind.com',
      	'Referer' => 'http://www.arbookfind.com/default.aspx',
      	'Upgrade-Insecure-Requests' => '1',
        "User-Agent" => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36'
      }
    end

  end

end

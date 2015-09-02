class SearchVakilController < ApplicationController
  require 'csv'
  def index
  end

  def vakil_list
    if !params[:search_by_city].blank?
        @lawyer_city = LawyerCity.find(params[:location])
        puts @lawyer_city.location
        @lawyercity = LawyerCity.where(:location =>@lawyer_city.location)
    elsif !params[:search_by_service].blank?
        @lawyer_service = LawyerService.find(params[:service])
        puts @lawyer_service.service_name
        @lawyerservice = LawyerService.where(:service_name =>@lawyer_service.service_name)
    elsif !params[:search_by_city_and_service].blank?
        @lawyer_cityr = LawyerCity.find(params[:location])
        @lawyercityr = LawyerCity.where(:location =>@lawyer_cityr.location)
        @lawyer_servicer = LawyerService.find(params[:service])
        @lawyerservicer = LawyerService.where(:service_name =>@lawyer_servicer.service_name)
        @lawyer_city_service = []
        @lawyerservicer.each do |service|
          @lawyercity = LawyerCity.where(:location =>@lawyer_cityr.location,:lawyer_code=>service.lawyer_code)
          if !@lawyercity.blank?
            @lawyer_city_service << service
          else
          end

        end
    end
  end

  def search_by_city
  end

  def search_by_service
  end

  def search_by_city_and_service
  end
  def upload_data

  end
  def upload_city_data
     CSV.foreach(params[:file_city].path, headers: true) do |row|
        @lawyer_city = LawyerCity.new
        @lawyer_city.lawyer_code = row[0]
        @lawyer_city.lawyer_namestring = row[1]
        @lawyer_city.location = row[3]
        @lawyer_city.exp = row[2]
        puts row[3]
        @lawyer_city.average_rating = row[4]
        @lawyer_city.save
    end
  end
    def upload_service_data
     CSV.foreach(params[:file_service].path, headers: true) do |row|
        @lawyer_service = LawyerService.new
        @lawyer_service.lawyer_code = row[0]
        @lawyer_service.service_code = row[1]
        @lawyer_service.service_name = row[2]
        @lawyer_service.service_charge = row[3]
        @lawyer_service.save
    end
  end
  def upload_data_to_database
    CSV.foreach('Lawyers_City_List.csv', :headers => true) do |row|
       @lawyer_city = LawyerCity.new
        @lawyer_city.lawyer_code = row[0]
        @lawyer_city.lawyer_namestring = row[1]
        @lawyer_city.location = row[3]
        @lawyer_city.exp = row[2]
        puts row[3]
        @lawyer_city.average_rating = row[4]
        @lawyer_city.save
        puts "I am saveed for city"

    end
    puts "Now i am started for service"
      CSV.foreach('Lawyer_Service_List.csv', :headers => true) do |row|
       @lawyer_service = LawyerService.new
        @lawyer_service.lawyer_code = row[0]
        @lawyer_service.service_code = row[1]
        @lawyer_service.service_name = row[2]
        @lawyer_service.service_charge = row[3]
        @lawyer_service.save
        puts "i am saved for service"
    end
    if @lawyer_service.save
      render :js => "alert('you have done ');"
    end 
  end
end

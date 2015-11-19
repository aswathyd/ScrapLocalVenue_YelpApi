require 'yelp'
require 'csv'


#create and configure yelp client with API keys
Yelp.client.configure do |config|
  config.consumer_key = "7ewRL877x6gRXCiaFoHZjg"
  config.consumer_secret = "FiRUd-JlDfFQg_bg4ozXY0uTIzA"
  config.token = "3jv5tZX1FQB_HoqftL1ipE1HQdo1RN_N"
  config.token_secret = "q6s0_2Bbmfh9u5NLV7L_QkeUeJc"
 end

#open csv file to save search result
 CSV.open("Medford.csv", "wb") do  |csv|
 csv <<["Brand*", "Store id", "Name", "Lat*", "Lng*", "Address1", "Address2", "City", "State", "Zip code", "Country", "Phone number", "Fax number", "Store hours", "Time zone", "Dma Code", "Status*"]

x = 20

while x < 2000 do
 params = { 
 			limit: 20,
 			offset: x,
 			sort:0
        }
        
#make a request to the search API
response = Yelp.client.search('Medford, MA', params)

#looping through each business to get all related fields (Ex: Lat/Long, Categories etc) and saving in csv
(0..19).each do |i|
	#puts response.businesses[i].location.city
	if response.businesses[i].location.city == "Medford"

	    Brand = response.businesses[i].name

	    Name = response.businesses[i].name
		Storeid = "" 
		Lat = response.businesses[i].location.coordinate.latitude
		Long = response.businesses[i].location.coordinate.longitude

		#Brand = response.businesses[i].categories[0][0]
		Address1 = response.businesses[i].location.display_address[0]
		#Address2 = response.businesses[i].location.display_address[1]
		Address2 = ""
		City = response.businesses[i].location.city
		State = response.businesses[i].location.state_code
		Zipcode =response.businesses[i].location.postal_code
		Country = response.businesses[i].location.country_code
		Phone = response.businesses[i].phone
		Fax = ""
		StoreHours = ""
		TimeZone = "EST"
		DmaCode = ""
		Status = "Active"
		csv << [ Brand, Storeid, Name, Lat, Long, Address1, Address2, City, State, Zipcode, Country, Phone, Fax, StoreHours, TimeZone, DmaCode, Status]
	end
end
#puts x
 x= x+20
end

end

  

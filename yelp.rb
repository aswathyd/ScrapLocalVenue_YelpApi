require 'yelp'
require 'csv'


#create and configure a client with API keys
Yelp.client.configure do |config|
  config.consumer_key = "7ewRL877x6gRXCiaFoHZjg"
  config.consumer_secret = "FiRUd-JlDfFQg_bg4ozXY0uTIzA"
  config.token = "3jv5tZX1FQB_HoqftL1ipE1HQdo1RN_N"
  config.token_secret = "q6s0_2Bbmfh9u5NLV7L_QkeUeJc"
 end

#open csv file to save search result
CSV.open("file.csv", "wb") do  |csv|
csv <<["Name", "Brand*", "Lat*", "Lng*", "Address1", "Address2", "City", "State", "Zip code", "Country", "Phone", "Store hours", "Time zone", "Dma Code", "Status*"]

 params = { term: 'food'
         }
#make a request to the search API
response = Yelp.client.search('Arlington, MA', params)

 
(0..19).each do |i|
	Name = response.businesses[i].name
	Lat = response.businesses[i].location.coordinate.latitude
	Lng = response.businesses[i].location.coordinate.longitude
	Brand = response.businesses[i].categories[0][0]
	Address1 = response.businesses[i].location.display_address[0]
	Address2 = response.businesses[i].location.display_address[1]
	City = response.businesses[i].location.city
	State = response.businesses[i].location.state_code
	Zipcode =response.businesses[i].location.postal_code
	Country = response.businesses[i].location.country_code
	Phone = response.businesses[i].phone
	#Store hours =
	#Time zone =
	#Dma Code =
	#Status =
	csv << [Name, Brand, Lat, Lng, Address1, Address2, City, State, Zipcode, Country, Phone]

end
end
  

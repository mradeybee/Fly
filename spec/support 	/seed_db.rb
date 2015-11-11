Flight.destroy_all
Airport.destroy_all

airports = [
  { name: 'Nnamdi Azikwe International Airport, Abuja', location: 'Abuja', abrv: 'ABJ'},
  { name: 'Akanu Ibiam International Airport, Enugu', location: 'Enugu', abrv: 'EGU'},
  { name: 'Alakia Airport, Ibadan', location: 'Ibadan', abrv: 'IBD' },
  { name: 'Arakale Airport, Akure', location: 'Akure', abrv: 'AKR' },
  { name: 'Mallam Aminu Kano International Airport, Kano', location: 'Kano', abrv: 'KNO'},
  { name: 'Murtala Muhammed International Airport, Lagos', location: 'Lagos', abrv: 'LGS' },
  { name: 'Port Harcourt International Airport, Port Harcourt', location: 'Port Harcourt', abrv: 'PHC'},
  { name: 'Sir Abubakar Tafawa Balewa Airport, Bauchi', location: 'Bauchi', abrv: 'BCH'},
  { name: 'Margaret Ekpo International Airport, Calabar', location: 'Calabar', abrv: 'CAL'},
  { name: 'Yakubu Gowon Airport, Jos', location: 'Jos', abrv: 'JOS' },
  { name: 'Kaduna Airport, Kaduna', location: 'Kaduna', abrv: 'KAD' },
  { name: 'Maiduguri International Airport, Borno', location: 'Borno', abrv: 'BRN' },
  { name: 'Sadiq Abubakar III International Airport, Sokoto', location: 'Sokoto', abrv: 'SKT'},
  { name: 'Yola Airport, Yola', location: 'Yola', abrv: 'YLA'}
]
airlines = ['Arik Air', 'Dana Air', 'Andela Air', 'Sosoliso Air', 'Nigerian Airways', 'Aero Contractors', 'Kuvokiland Airlines', 'Ikem Air', 'Adeybee Air', 'Comet Aviation', 'Galaxy Skylines', 'Workdey Air', 'K-S Air', 'Arnold Air', 'Edo Airways', 'Night Crawlers', 'TIA Liners', 'Peak Flyers']
  airports.each do |airport|
    Airport.create(airport)
end

5.times{
  forward_rand = Random.rand(0..30)
  date = Faker::Time.forward(12, :morning)
  flight = Flight.new
  flight.airline = airlines.sample
  flight.origin_id = Airport.order('RANDOM()').first.id
  flight.destination_id = Airport.order('RANDOM()').where.not(id: flight.origin_id).first.id
  flight.departure_date = date
  flight.arrival_date = date + forward_rand.hour
  flight.price = Faker::Commerce.price
  flight.save!
}
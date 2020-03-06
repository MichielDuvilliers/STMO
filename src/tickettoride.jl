#=
Created on Wednesday 29 January 2020
Last update: -

@author: Michiel Stock
michielfmstock@gmail.com

Ticket to ride dataset

Choo choo
🚂
=#

module TicketToRide

using STMO

const tickettoride_edges = [(1, "Vancouver", "Seattle"),
          (1, "Seattle", "Portland"),
          (3, "Vancouver", "Calgary"),
          (6, "Calgary", "Winnipeg"),
          (6, "Winnipeg", "Sault Ste. Marie"),
          (4, "Winnipeg", "Helena"),
          (4, "Calgary", "Helena"),
          (6, "Seattle", "Helena"),
          (4, "Seattle", "Calgary"),
          (6, "Portland", "Salt Lake City"),
          (5, "Portland", "San Francisco"),
          (5, "San Francisco", "Salt Lake City"),
          (3, "San Francisco", "Los Angeles"),
          (2, "Los Angeles", "Las Vegas"),
          (3, "Los Angeles", "Phoenix"),
          (6, "Los Angeles", "El Paso"),
          (3, "Phoenix", "El Paso"),
          (3, "Phoenix", "Santa Fe"),
          (3, "Las Vegas", "Salt Lake City"),
          (5, "Phoenix", "Denver"),
          (3, "Salt Lake City", "Denver"),
          (3, "Helena", "Salt Lake City"),
          (6, "Helena", "Duluth"),
          (4, "Winnipeg", "Duluth"),
          (4, "Helena", "Denver"),
          (5, "Helena", "Omaha"),
          (4, "Denver", "Omaha"),
          (4, "Denver", "Kansas City"),
          (2, "Denver", "Santa Fe"),
          (2, "Santa Fe", "El Paso"),
          (3, "Santa Fe", "Oklahoma City"),
          (4, "Denver", "Oklahoma City"),
          (6, "El Paso", "Houston"),
          (4, "El Paso", "Dallas"),
          (5, "El Paso", "Oklahoma City"),
          (1, "Dallas", "Houston"),
          (2, "Dallas", "Oklahoma City"),
          (2, "Kansas City", "Oklahoma City"),
          (1, "Omaha", "Kansas City"),
          (2, "Omaha", "Duluth"),
          (3, "Duluth", "Chicago"),
          (4, "Omaha", "Chicago"),
          (6, "Duluth", "Toronto"),
          (3, "Duluth", "Sault Ste. Marie"),
          (5, "Sault Ste. Marie", "Montreal"),
          (2, "Montreal", "Boston"),
          (2, "Boston", "New York"),
          (3, "Montreal", "New York"),
          (3, "Montreal", "Toronto"),
          (4, "Toronto", "Chicago"),
          (3, "Chicago", "Pittsburgh"),
          (2, "Chicago", "Saint Louis"),
          (2, "Pittsburgh", "Toronto"),
          (2, "Toronto", "Sault Ste. Marie"),
          (2, "Pittsburgh", "New York"),
          (2, "Pittsburgh", "Washington"),
          (2, "Washington", "New York"),
          (2, "Washington", "Raleigh"),
          (2, "Pittsburgh", "Raleigh"),
          (5, "Pittsburgh", "Saint Louis"),
          (2, "Kansas City", "Saint Louis"),
          (2, "Nashville", "Saint Louis"),
          (2, "Little Rock", "Saint Louis"),
          (2, "Oklahoma City", "Little Rock"),
          (2, "Little Rock", "Dallas"),
          (3, "Little Rock", "Nashville"),
          (2, "Houston", "New Orleans"),
          (3, "Little Rock", "New Orleans"),
          (4, "New Orleans", "Atlanta"),
          (1, "Atlanta", "Nashville"),
          (4, "Nashville", "Pittsburgh"),
          (2, "Atlanta", "Raleigh"),
          (3, "Nashville", "Raleigh"),
          (2, "Raleigh", "Charleston"),
          (2, "Charleston", "Atlanta"),
          (6, "New Orleans", "Miami"),
          (5, "Atlanta", "Miami"),
          (4, "Charleston", "Miami")
          ]

const cities_coordinates = Dict("Atlanta" => (-84.3901849, 33.7490987),
                               "Boston" => (-71.0595678, 42.3604823),
                               "Calgary" => (-114.0625892, 51.0534234),
                               "Charleston" => (-79.9402728, 32.7876012),
                               "Chicago" => (-87.6244212, 41.8755546),
                               "Dallas" => (-96.7968559, 32.7762719),
                               "Denver" => (-104.9847034, 39.7391536),
                               "Duluth" => (-92.1251218, 46.7729322),
                               "El Paso" => (-106.501349395577, 31.8111305),
                               "Helena" => (-112.036109, 46.592712),
                               "Houston" => (-95.3676974, 29.7589382),
                               "Kansas City" => (-94.5630298, 39.0844687),
                               "Las Vegas" => (-115.149225, 36.1662859),
                               "Little Rock" => (-92.2895948, 34.7464809),
                               "Los Angeles" => (-118.244476, 34.054935),
                               "Miami" => (-80.1936589, 25.7742658),
                               "Montreal" => (-73.6103642, 45.4972159),
                               "Nashville" => (-86.7743531, 36.1622296),
                               "New Orleans" => (-89.9750054503052, 30.03280175),
                               "New York" => (-73.9866136, 40.7306458),
                               "Oklahoma City" => (-97.5170536, 35.4729886),
                               "Omaha" => (-95.9378732, 41.2587317),
                               "Phoenix" => (-112.0773456, 33.4485866),
                               "Pittsburgh" => (-79.99, 40.42),
                               "Portland" => (-122.6741949, 45.5202471),
                               "Raleigh" => (-78.6390989, 35.7803977),
                               "Saint Louis" => (-90.12954315, 38.60187637),
                               "Salt Lake City" => (-111.8904308, 40.7670126),
                               "San Francisco" => (-122.49, 37.75),
                               "Santa Fe" => (-105.9377997, 35.6869996),
                               "Sault Ste. Marie" => (-84.320068, 46.52391),
                               "Seattle" => (-122.3300624, 47.6038321),
                               "Toronto" => (-79.387207, 43.653963),
                               "Vancouver" => (-123.1139529, 49.2608724),
                               "Washington" => (-77.0366456, 38.8949549),
                               "Winnipeg" => (-97.168579, 49.884017))

const cities = [k for k in keys(cities_coordinates)]

tickettoride_dist(c1, c2) = sqrt(sum((cities_coordinates[c1] .- cities_coordinates[c2]).^2))

tickettoride_edges_dists = [(tickettoride_dist(u, v), u, v) for (w, u, v) in tickettoride_edges]

const tickettoride_graph = edges2adjlist(tickettoride_edges_dists)

export tickettoride_edges, cities_coordinates, cities, tickettoride_dist, tickettoride_graph
end  # module TicketToRide

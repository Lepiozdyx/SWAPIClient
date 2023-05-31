//
//  StarWars.swift
//  ParsingJSONApp
//
//  Created by Alex on 06.05.2023.
//

import Foundation

struct StarWars: Decodable {
    let totalRecords: Int
    let totalPages: Int
    let previous: String?
    let next: String?
    let results: [Essence]
}
    
struct Essence: Decodable {
    let uid: String
    let name: String
    let url: String
}

// MARK: - People model
struct People: Decodable {
    let result: PeopleData
}

struct PeopleData: Decodable {
    let properties: PersonProperties
}

struct PersonProperties: Decodable {
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let name: String
    let homeworld: String
    let url: String
    
    var description: String {
        """
        Name: \(name)
        Height: \(height)
        Mass: \(mass)
        Hair color: \(hairColor)
        Skin color: \(skinColor)
        Eye color: \(eyeColor)
        Birth year: \(birthYear)
        Gender: \(gender)
    """
    }
}

// MARK: - Planets model
struct Planets: Decodable {
    let result: PlanetsData
}

struct PlanetsData: Decodable {
    let properties: PlanetProperties
}

struct PlanetProperties: Decodable {
    let diameter: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let gravity: String
    let population: String
    let climate: String
    let terrain: String
    let name: String
    let url: String
    
    var description: String {
        """
        Name: \(name)
        Diameter: \(diameter)
        Rotation period: \(rotationPeriod)
        Orbital period: \(orbitalPeriod)
        Gravity: \(gravity)
        Population: \(population)
        Climate: \(climate)
        Terrain: \(terrain)
    """
    }
}

// MARK: - Starships model
struct Starships: Decodable {
    let result: StarshipsData
}

struct StarshipsData: Decodable {
    let properties: StarshipProperties
}

struct StarshipProperties: Decodable {
    let model: String
    let starshipClass: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let crew: String
    let passengers: String
    let maxAtmospheringSpeed: String
    let hyperdriveRating: String
    let cargoCapacity: String
    let name: String
    let url: String
    
    var description: String {
        """
        Name: \(name)
        Model: \(model)
        Starship class: \(starshipClass)
        Manufacturer: \(manufacturer)
        Cost in credits: \(costInCredits)
        Length: \(length)
        Crew: \(crew)
        Passengers: \(passengers)
        Max atmospheric velocity: \(maxAtmospheringSpeed)
        Hyperdrive rating: \(hyperdriveRating)
        Cargo capacity: \(cargoCapacity)
    """
    }
}

// MARK: - Vehicles model
struct Vehicles: Decodable {
    let result: VehiclesData
}

struct VehiclesData: Decodable {
    let properties: VehicleProperties
}

struct VehicleProperties: Decodable {
    let model: String
    let vehicleClass: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let crew: String
    let passengers: String
    let maxAtmospheringSpeed: String
    let cargoCapacity: String
    let name: String
    let url: String
    
    var description: String {
        """
        Name: \(name)
        Model: \(model)
        Vehicle class: \(vehicleClass)
        Manufacturer: \(manufacturer)
        Cost in credits: \(costInCredits)
        Length: \(length)
        Crew: \(crew)
        Passengers: \(passengers)
        Max atmospheric velocity: \(maxAtmospheringSpeed)
        Cargo capacity: \(cargoCapacity)
    """
    }
}


// MARK: - Films model
struct Films: Decodable {
    let result: FilmsData
}

struct FilmsData: Decodable {
    let properties: FilmProperties
}

struct FilmProperties: Decodable {
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let created: String
    let edited: String
    let producer: String
    let title: String
    let episodeId: Int
    let director: String
    let releaseDate: String
    let openingCrawl: String
    let url: String
    
    var description: String {
        """

    """
    }
}

// MARK: - URl enumeration
enum StarWarsAPI {
    case peopleURL
    case planetsURL
    case starshipsURL
    case filmsURL
    case vehiclesURL
    
    var url: URL {
        switch self {
        case .peopleURL:
            return URL(string: "https://www.swapi.tech/api/people/")!
        case .planetsURL:
            return URL(string: "https://www.swapi.tech/api/planets/")!
        case .starshipsURL:
            return URL(string: "https://www.swapi.tech/api/starships/")!
        case .filmsURL:
            return URL(string: "https://www.swapi.tech/api/films/")!
        case .vehiclesURL:
            return URL(string: "https://www.swapi.tech/api/vehicles/")!
        }
    }
}

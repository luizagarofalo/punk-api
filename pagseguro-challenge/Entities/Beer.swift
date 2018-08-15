import Foundation

typealias Beers = [Beer]

struct Beer: Codable {
    let id: Int?
    let name, tagline, firstBrewed, description: String?
    let imageURL: String?
    let abv, ibu, attenuationLevel: Double?
    let method: Method?
    let ingredients: Ingredients?
    let foodPairing: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case description
        case imageURL = "image_url"
        case abv, ibu
        case attenuationLevel = "attenuation_level"
        case method, ingredients
        case foodPairing = "food_pairing"
    }
}

struct BoilVolume: Codable {
    let value: Double?
    let unit: String?
}

struct Ingredients: Codable {
    let malt: [Malt]?
    let hops: [Hop]?
    let yeast: String?
}

struct Hop: Codable {
    let name: String?
    let amount: BoilVolume?
    let add, attribute: String?
}

struct Malt: Codable {
    let name: String?
    let amount: BoilVolume?
}

struct Method: Codable {
    let mashTemp: [MashTemp]?
    let fermentation: Fermentation?
    let twist: String?

    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation, twist
    }
}

struct Fermentation: Codable {
    let temp: BoilVolume?
}

struct MashTemp: Codable {
    let temp: BoilVolume?
    let duration: Int?
}

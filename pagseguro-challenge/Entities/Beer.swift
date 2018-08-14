import Foundation

typealias Beers = [Beer]

struct Beer: Codable {
    let id: Int?
    let name, tagline, firstBrewed, description: String?
    let imageURL: String?
    let abv, ibu, targetFg, targetOg: Double?
    let ebc, srm, ph, attenuationLevel: Double?
    let volume, boilVolume: BoilVolume?
    let method: Method?
    let ingredients: Ingredients?
    let foodPairing: [String]?
    let brewersTips, contributedBy: String?

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case description
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc, srm, ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case method, ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
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

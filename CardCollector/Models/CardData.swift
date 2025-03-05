//
//  CardData.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/4/25.
//

import Foundation

struct CardData: Codable {
    let id: String
    let name: String
    let supertype: CardSuperType
    let subtypes: [CardSubType]
    let hp: String
    let types: [CardType]
    let evolvesFrom: String
    let evolvesTo: [String]
    let rules: [String]
    let abilities: [CardAbility]
    let attacks: [CardAttack]
    let weaknesses: [CardWeaknessOrResistance]
    let resistances: [CardWeaknessOrResistance]
    let retreatCost: [CardType]
    let convertedRetreatCost: Int
    let set: CardSet
    let number: String
    let artist: String
    let rarity: String
    let flavorText: String
    let nationalPokedexNumbers: [Int]
    let legalities: CardSetLegality
    let regulationMark: String
    let images: CardImage
    let tcgplayer: CardTCGPlayer
}

/// The supertype of the card, such as Pokémon, Energy, or Trainer.
enum CardSuperType: String, Codable {
    case pokemon = "Pokémon"
    case energy = "Energy"
    case trainer = "Trainer"
}

enum CardSubType: String, Codable {
    case `break` = "BREAK"
    case baby = "Baby"
    case basic = "Basic"
    case ex = "EX"
    case gx = "GX"
    case goldenrodGameCorner = "Goldenrod Game Corner"
    case `item` = "Item"
    case legend = "LEGEND"
    case levelUp = "Level-Up"
    case mega = "MEGA"
    case pokemonTool = "Pokémon Tool"
    case pokemonToolF = "Pokémon Tool F"
    case rapidStrike = "Rapid Strike"
    case restored = "Restored"
    case rocketsSecretMachine = "Rocket's Secret Machine"
    case singleStrike = "Single Strike"
    case special = "Special"
    case stadium = "Stadium"
    case stage1 = "Stage 1"
    case stage2 = "Stage 2"
    case supporter = "Supporter"
    case tagTeam = "TAG TEAM"
    case technicalMachine = "Technical Machine"
    case vPokemon = "V"
    case vmaxPokemon = "VMAX"
}

enum CardType: String, Codable {
    case colorless = "Colorless"
    case darkness = "Darkness"
    case dragon = "Dragon"
    case fairy = "Fairy"
    case fighting = "Fighting"
    case `fire` = "Fire"
    case grass = "Grass"
    case lightning = "Lightning"
    case metal = "Metal"
    case psychic = "Psychic"
    case water = "Water"
}

enum CardRarity: String, Codable {
    case amazingRare = "Amazing Rare"
    case `common` = "Common"
    case legend = "LEGEND"
    case promo = "Promo"
    case rare = "Rare"
    case rareAce = "Rare ACE"
    case rareBreak = "Rare BREAK"
    case rareHolo = "Rare Holo"
    case rareHoloEx = "Rare Holo EX"
    case rareHoloGx = "Rare Holo GX"
    case rareHoloLvX = "Rare Holo LV.X"
    case rareHoloStar = "Rare Holo Star"
    case rareHoloV = "Rare Holo V"
    case rareHoloVmax = "Rare Holo VMAX"
    case rarePrime = "Rare Prime"
    case rarePrismStar = "Rare Prism Star"
    case rareRainbow = "Rare Rainbow"
    case rareSecret = "Rare Secret"
    case rareShining = "Rare Shining"
    case rareShiny = "Rare Shiny"
    case rareShinyGx = "Rare Shiny GX"
    case rareUltra = "Rare Ultra"
    case uncommon = "Uncommon"
}

//
//  Model.swift
//  ValorantApp
//
//  Created by Mehmet ÖKSÜZ on 2.12.2023.
//

import Foundation

struct DatumResponse: Codable {
    let status: Int
    let data: [Datum]
}

struct Datum: Codable {
    let uuid, displayName, description, developerName: String
    let characterTags: [String]?
    let displayIcon, displayIconSmall: String
    let bustPortrait, fullPortrait, fullPortraitV2: String?
    let killfeedPortrait: String
    let background: String?
    let backgroundGradientColors: [String]
    let assetPath: String
    let isFullPortraitRightFacing, isPlayableCharacter, isAvailableForTest, isBaseContent: Bool
    let role: Role?
    let abilities: [Ability]
}

struct Ability: Codable {
    let slot: Slot
    let displayName, description: String
    let displayIcon: String?
}

enum Slot: String, Codable {
    case ability1 = "Ability1"
    case ability2 = "Ability2"
    case grenade = "Grenade"
    case passive = "Passive"
    case ultimate = "Ultimate"
}

struct Role: Codable {
    let uuid: String
    let displayName: DisplayName
    let description: String
    let displayIcon: String
    let assetPath: String
}

enum DisplayName: String, Codable {
    case düellocu = "Düellocu"
    case gözcü = "Gözcü"
    case kontrolUzmanı = "Kontrol Uzmanı"
    case öncü = "Öncü"
}







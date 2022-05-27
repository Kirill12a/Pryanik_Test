//
//  JSONModel.swift
//  Pryanik_Test
//
//  Created by Kirill Drozdov on 27.05.2022.
//


struct JSONModel: Decodable {
    let data: [DataArray]
    let view: [String]
}

struct DataArray: Decodable {
    let name: String
    let data: DataInformation
}

struct DataInformation: Decodable {
    let url: String?
    let text: String?
    let selectedId: Int?
    let variants: [Variants]?
}

struct Variants: Decodable {
    let id: Int
    let text: String
}

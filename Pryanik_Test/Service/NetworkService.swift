//
//  NetworkService.swift
//  Pryanik_Test
//
//  Created by Kirill Drozdov on 27.05.2022.
//

import Alamofire

protocol NetworkProtocol{
    static func fetchData(completion: @escaping (JSONModel) -> Void)
}



class NetworkService: NetworkProtocol {

    static func fetchData(completion: @escaping (JSONModel) -> Void) {

        AF.request("https://pryaniky.com/static/json/sample.json").responseJSON { (response) in
            guard let data = response.data else {return}
            do {
                let json = try JSONDecoder().decode(JSONModel.self, from: data)
                completion(json)
            } catch let error as NSError{
                print(error.localizedDescription)
            }
        }
    }
}

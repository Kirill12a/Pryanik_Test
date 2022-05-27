//
//  MainCellViewModel.swift
//  Pryanik_Test
//
//  Created by Kirill Drozdov on 27.05.2022.
//

import Foundation

protocol MainCellViewModelType: AnyObject {
    var text: String { get }
    var imgString: String? { get }
}

class MainCellViewModel: MainCellViewModelType {
    var text: String
    var imgString: String?

    init(text: String, imgString: String?) {
        self.text = text
        self.imgString = imgString
    }
}

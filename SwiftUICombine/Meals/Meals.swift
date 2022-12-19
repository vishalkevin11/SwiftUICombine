//
//  Meals.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 19/12/22.
//

import Foundation


struct MealsData: Decodable {
    var meals: [Meals]
}

struct Meals: Decodable {
    var mealName: String
    var instructions: String
    var imageUrl: String
//    var ingredients:[String]
    
    private enum CodingKeys: String, CodingKey {
        case mealName = "strMeal"
        case instructions = "strInstructions"
        case imageUrl = "strMealThumb"
//        case ingredients:[String]
    }
}

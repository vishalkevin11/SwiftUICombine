//
//  MealsNetworkManager.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 18/12/22.
//

import Combine
import Foundation


class MealsNetworkManager: ObservableObject {
    @Published var currentMeals: Meals?
    @Published var currentMealsImageUrl: String?
    var cancellable = [AnyCancellable]()
    
    func fetchRandomMeal() {
        URLSession(configuration: .default).dataTaskPublisher(for: URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                
            } receiveValue: { (data: Data, response: URLResponse) in
                if let meals = try? JSONDecoder().decode(MealsData.self, from: data) {
                    self.currentMeals = meals.meals.first
                    self.currentMealsImageUrl = self.currentMeals?.imageUrl
                }
            }
            .store(in: &cancellable)
    }
}

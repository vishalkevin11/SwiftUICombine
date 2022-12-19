//
//  MealsContentView.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 17/12/22.
//

import SwiftUI
import Combine

struct MealsContentView: View {
    @StateObject var mealsNetworkManager = MealsNetworkManager()
    var body: some View {
        VStack {
            if let name = mealsNetworkManager.currentMeals?.mealName {
                Text(name)
            }
           // if let thumbImage = mealsNetworkManager.currentMeals?.imageUrl {
            AsynImageView(url: $mealsNetworkManager.currentMealsImageUrl)
          //  }
            Button {
                mealsNetworkManager.fetchRandomMeal()
            } label: {
                Text("Show Recipie")
            }

        }
    }
}

struct MealsContentView_Previews: PreviewProvider {
    static var previews: some View {
        MealsContentView()
    }
}

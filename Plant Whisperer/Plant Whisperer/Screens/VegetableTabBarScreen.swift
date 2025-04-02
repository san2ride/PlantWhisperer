//
//  VegetableTabBarScreen.swift
//  Plant Whisperer
//
//  Created by Jason Sanchez on 4/2/25.
//

import SwiftUI

struct VegetableTabBarScreen: View {
    var body: some View {
        TabView {
            NavigationStack {
                VegetableListScreen()
            }.tabItem {
                Image(systemName: "leaf")
                Text("Vegetables")
                }
            NavigationStack {
                Text("MyGardenScreen")
            }.tabItem {
                Image(systemName: "house")
                Text("My Garden")
                }
            NavigationStack {
                Text("Pests")
            }.tabItem {
                Image(systemName: "ladybug")
                Text("Pests")
                }
        }
    }
}

#Preview {
    VegetableTabBarScreen()
}

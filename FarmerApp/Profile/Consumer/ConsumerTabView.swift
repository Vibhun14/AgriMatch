//
//  ConsumerTabView.swift
//  FarmerApp
//
//  Created by vibhun naredla on 3/22/25.
//

import SwiftUI

struct ConsumerTabView: View {
    @State private var path = NavigationPath()
    @State private var tabSelection = 1
    @State private var hideParentTabBar = false
    @State private var showTabBar = true

    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView(tabSelection: $tabSelection, showTabBar: $showTabBar, path: $path)
                .background {
                    if !hideParentTabBar {
                        HideTabView { hideParentTabBar = true }
                    }
                }
                .tag(1)

            ShopView().tag(2)
            CartView().tag(3)
            SearchView().tag(4)
            ProfileView().tag(5)
        }
        .overlay(alignment: .bottom) {
            if showTabBar {
                CustomTabBar(tabSelection: $tabSelection)
            }
        }
        .ignoresSafeArea()
    }
}

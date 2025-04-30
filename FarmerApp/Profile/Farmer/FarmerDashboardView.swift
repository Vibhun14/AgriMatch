//
//  FarmerDashboardView.swift
//  FarmerApp
//
//  Created by vibhun naredla on 3/22/25.
//

import SwiftUI

struct FarmerDashboardView: View {
    var body: some View {
        VStack {
            Text("🚜 Farmer Dashboard")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Welcome, farmer! This is your control center.")
                .font(.title3)
                .foregroundColor(.gray)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AgriGreen").opacity(0.2))
        .ignoresSafeArea()
    }
}

#Preview {
    FarmerDashboardView()
}

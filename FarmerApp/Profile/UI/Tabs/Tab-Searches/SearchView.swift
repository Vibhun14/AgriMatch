//
//  SearchView.swift
//  FarmerApp
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = PlantCardViewModel()
    @State private var searchText = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var filteredPlants: [PlantCard] {
        if searchText.isEmpty {
            return []
        } else {
            return viewModel.cards.filter { plant in
                plant.plantName.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search for a plant...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                List {
                    ForEach(filteredPlants) { plant in
                        HStack {
                            AsyncImage(url: URL(string: plant.imageURL)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                } else {
                                    Color.gray
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                }
                            }
                            
                            Text(plant.plantName)
                                .font(.headline)
                        }
                        .padding(.vertical, 4)
                        .onTapGesture {
                            acceptPlant(plant: plant)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Search Plants")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("AgriCream").opacity(0.1))
        }
    }
    
    private func acceptPlant(plant: PlantCard) {
        authViewModel.savePlant(plant: plant, to: "acceptedPlants")
        print("Accepted plant from search: \(plant.plantName)")
    }
}

#Preview {
    SearchView()
}

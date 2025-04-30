//
//  SwipeCardView.swift
//  FarmerApp
//
//  Created by vibhun naredla on 4/28/25.
//

import SwiftUI

struct SwipeCardView: View {
    var title: String
    var description: String
    var imageName: String

    @Binding var offset: CGSize
    @Binding var isSwiped: Bool
    
    let maxDrag: CGFloat = 150.0
    let swipeThreshold: CGFloat = 120.0

    var body: some View {
        ZStack {
            // Background with color tint
            Color.white
                .overlay(
                    Color.green.opacity(clampedGreenOpacity)
                )
                .overlay(
                    Color.red.opacity(clampedRedOpacity)
                )
            
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: imageName)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(12)
                            .transition(.opacity)
                            .animation(.easeIn(duration: 0.5), value: UUID())
                    case .failure(_):
                        Color.red
                            .frame(height: 200)
                            .cornerRadius(12)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary) // adapt to dark/light automatically

                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding()
            .background(.ultraThinMaterial) // THE GLASS EFFECT
            .cornerRadius(20)

            
            // Floating "✔️" when dragging right
            if offset.width > 0 {
                VStack {
                    HStack {
                        Spacer()
                        Text("✔️")
                            .font(.system(size: 50))
                            .rotationEffect(.degrees(Double(offset.width / 10)))
                            .opacity(min(Double(offset.width / 100), 1))
                            .padding()
                    }
                    Spacer()
                }
            }
            
            // Floating "❌" when dragging left
            if offset.width < 0 {
                VStack {
                    HStack {
                        Text("❌")
                            .font(.system(size: 50))
                            .rotationEffect(.degrees(Double(offset.width / 10)))
                            .opacity(min(Double(-offset.width / 100), 1))
                            .padding()
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .frame(width: 300, height: 400)
        .cornerRadius(20)
        .shadow(radius: 8)
        .rotationEffect(.degrees(Double(offset.width / 20)))
        .offset(x: offset.width, y: offset.height)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    withAnimation(.easeInOut) {
                        if offset.width > swipeThreshold {
                            offset = CGSize(width: 1000, height: 0) // Fly off right
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                isSwiped = true
                            }
                        } else if offset.width < -swipeThreshold {
                            offset = CGSize(width: -1000, height: 0) // Fly off left
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                isSwiped = true
                            }
                        } else {
                            offset = .zero
                        }
                    }
                }
        )
        .animation(.spring(response: 0.5, dampingFraction: 0.8), value: offset)
    }
    
    // MARK: - Helper Computed Properties
    
    private var clampedGreenOpacity: Double {
        let value = offset.width / maxDrag
        return Double(max(0, min(value, 1)))
    }
    
    private var clampedRedOpacity: Double {
        let value = -offset.width / maxDrag
        return Double(max(0, min(value, 1)))
    }
}

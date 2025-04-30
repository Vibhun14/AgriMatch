//
//  ShopView.swift
//  Shopping
//
//  Created by Thanh Hoang on 17/3/25.
//

import SwiftUI

struct ShopView: View {
    
    //MARK: - Properties
    
    //MARK: - Initializes
    
    //MARK: - Contents
    var body: some View {
        TitleView(title: "Shop")
    }
}

#Preview {
    ShopView()
}

struct TitleView: View {
    
    //MARK: - Properties
    let title: String
    
    //MARK: - Initializes
    
    //MARK: - Contents
    var body: some View {
        VStack(spacing: 20.0) {
            Text("\(title) ")
                .font(.montExtraBold(size: 40.0))
            +
            Text("screen")
                .font(.montExtraBold(size: 40.0))
                .foregroundStyle(.blue)
            
            Text("FOLLOW")
                .font(.montExtraBold(size: 40.0))
                .foregroundStyle(.purple)
                .underline(true, color: .purple)
            +
            Text(" ME")
                .font(.montExtraBold(size: 40.0))
        }
    }
}

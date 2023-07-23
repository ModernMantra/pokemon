//
//  MaterialCardView.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import SwiftUI

struct MaterialCardView: View {
    
    var body: some View {
        ZStack {
            // Background color and corner radius
            roundedRectangle
            
            // Content of the card
            VStack {
                VStack(alignment: .center) {
                    title
                    subtitle
                }
                .padding()
                
                Spacer()
            }
        }
        .padding()
    }
    
}

// MARK: - Sub-components -

fileprivate extension MaterialCardView {
    
    @ViewBuilder
    var roundedRectangle: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(.Background.primary)
            .shadow(color: .Shadow.primary, radius: 8, x: 0, y: 4)
    }
    
    @ViewBuilder
    var title: some View {
        Text("Card Title")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.Text.primary)
    }
    
    @ViewBuilder
    var subtitle: some View {
        Text("Description of the card.")
            .font(.subheadline)
            .foregroundColor(.Text.secondary)
    }
    
}

struct MaterialCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        MaterialCardView()
    }
    
}

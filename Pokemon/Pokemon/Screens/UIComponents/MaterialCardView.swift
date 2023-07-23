//
//  MaterialCardView.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import SwiftUI

struct MaterialCardView: View {
    
    @State var title: String
    @State var subtitle: String
    
    @SwiftUI.Environment (\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            // Background color and corner radius
            roundedRectangle
            // Content of the card
            VStack {
                VStack(alignment: .center) {
                    titleView
                    subtitleView
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
            .shadow(
                color: .Shadow.primary.opacity(colorScheme == .dark ? 0 : 1.0),
                radius: 8,
                x: 0,
                y: 4
            )
    }
    
    @ViewBuilder
    var titleView: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.Text.primary)
    }
    
    @ViewBuilder
    var subtitleView: some View {
        Text(subtitle)
            .font(.subheadline)
            .foregroundColor(.Text.secondary)
    }
    
}

struct MaterialCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        MaterialCardView(title: "title", subtitle: "subtitle")
    }
    
}

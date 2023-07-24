//
//  TitleView.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 24. 7. 2023..
//

import SwiftUI

struct TitleText: View {
    
    @State var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.Text.primary)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(text: "test")
    }
}

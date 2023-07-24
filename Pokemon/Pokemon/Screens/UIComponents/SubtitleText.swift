//
//  SubtitleText.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 24. 7. 2023..
//

import SwiftUI

struct SubtitleText: View {
    
    @State var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundColor(.Text.secondary)
    }
}

struct SubtitleText_Previews: PreviewProvider {
    static var previews: some View {
        SubtitleText(text: "test")
    }
}

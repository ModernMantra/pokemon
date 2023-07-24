//
//  SubtitleView.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 24. 7. 2023..
//

import SwiftUI

struct SubtitleView: View {

    @State var titleText: String
    @State var subtitleText: String

    var body: some View {
        HStack {
            Text("\(titleText)")
            Spacer()
            Text("\(subtitleText)")
        }
        .padding(.horizontal)
    }
}

// MARK: - Preview -

struct SubtitleView_Previews: PreviewProvider {
    
    static var previews: some View {
        SubtitleView(titleText: "Title", subtitleText: "subtitle")
    }
    
}

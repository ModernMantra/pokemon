//
//  ErrorViewModifier.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 24. 7. 2023..
//

import SwiftUI

struct ErrorViewModifier: ViewModifier {

    @Binding var error: Error?
    let retryAction: (() -> Void)?

    func body(content: Content) -> some View {
        ZStack {
            content
            if let error = error {
                ErrorView(errorMessage: error.localizedDescription, retryAction: retryAction)
                    .onTapGesture {
                        // You can dismiss the error view by tapping it.
                        self.error = nil
                    }
            }
        }
    }
}

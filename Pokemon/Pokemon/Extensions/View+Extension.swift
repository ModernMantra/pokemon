//
//  View+Extension.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 24. 7. 2023..
//

import SwiftUI

extension View {

    func observeError(_ error: Binding<Error?>, retryAction: (() -> Void)? = nil) -> some View {
        self.modifier(ErrorViewModifier(error: error, retryAction: retryAction))
    }

}

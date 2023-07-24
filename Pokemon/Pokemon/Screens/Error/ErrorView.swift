//
//  ErrorView.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 24. 7. 2023..
//

import SwiftUI

struct ErrorView: View {

    let errorMessage: String
    let retryAction: (() -> Void)?

    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundColor(.red)

            Text(errorMessage)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()

            if let retryAction = retryAction {
                Button("Retry", action: retryAction)
                    .padding(.top)
            }
        }
        .padding()
    }
}

// MARK: - Preview -

struct ErrorView_Previews: PreviewProvider {

    static var previews: some View {
        ErrorView(errorMessage: "hello", retryAction: nil)
    }

}

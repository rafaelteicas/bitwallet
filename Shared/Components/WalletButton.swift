//
//  WalletButton.swift
//  BitWallet
//
//  Created by Rafael Castro on 31/05/25.
//

import SwiftUI

struct WalletButton: View {
    var action: () -> Void
    var title: String
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.primary)
                )
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    WalletButton(
        action: {},
        title: "Button"
    )
}

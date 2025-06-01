//
//  WalletButton.swift
//  BitWallet
//
//  Created by Rafael Castro on 31/05/25.
//

import SwiftUI

struct WalletButton: View {
    enum ButtonStyle {
        case primary, secondary
    }
    
    var title: String
    var style: ButtonStyle = .primary
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(style == .primary ? Color.primary : Color.secondary)
                )
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    VStack {
        WalletButton(title: "Button") {}
        WalletButton(title: "Button", style: .secondary) {}
    }
}

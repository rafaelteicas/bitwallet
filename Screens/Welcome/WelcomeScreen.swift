//
//  WelcomeScreen.swift
//  BitWallet
//
//  Created by Rafael Castro on 31/05/25.
//

import SwiftUI

struct WelcomeScreen: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack {
            WalletButton(title: "Create Wallet") {
                router.authRoutes.append(.pin(.createWallet()))
            }
            
            WalletButton(title: "Import Wallet", style: .secondary) {
                router.authRoutes.append(.pin(.importWallet()))
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

#Preview {
    WelcomeScreen()
        .environment(Router())
}

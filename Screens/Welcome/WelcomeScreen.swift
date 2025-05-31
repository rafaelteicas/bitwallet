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
            WalletButton(action: {
                router.authRoutes.append(.createWallet)
            }, title: "Create Wallet")
        }
    }
}

#Preview {
    WelcomeScreen()
        .environment(Router())
}

//
//  AuthRoutes.swift
//  BitWallet
//
//  Created by Rafael Castro on 31/05/25.
//

import SwiftUI

indirect enum AuthRoutes: Hashable {
    case pin(Self), importWallet(_ pin: String = ""), createWallet(_ pin: String = "")
}

struct AuthRoutesStack: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router.authRoutes) {
            WelcomeScreen()
            .navigationDestination(for: AuthRoutes.self) { route in
                switch route {
                case .pin(let nextRoute):
                    PinScreen(
                        isCreatePin: true,
                        nextRoute: nextRoute
                    )
                case .createWallet(let pin):
                    CreateWalletScreen()
                        
                case .importWallet(let pin):
                    Text("Import Wallet Screen")
                }
            }
        }
    }
}

#Preview {
    AuthRoutesStack()
        .environment(Router())
}

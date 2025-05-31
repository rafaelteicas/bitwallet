//
//  AuthRoutes.swift
//  BitWallet
//
//  Created by Rafael Castro on 31/05/25.
//

import SwiftUI

enum AuthRoutes: Hashable {
    case importWallet, createWallet
}

struct AuthRoutesStack: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router.authRoutes) {
            WelcomeScreen()
            .navigationDestination(for: AuthRoutes.self) { route in
                switch route {
                case .createWallet:
                    Text("Create")
                case .importWallet:
                    Text("Import")
                }
            }
        }
    }
}

#Preview {
    AuthRoutesStack()
        .environment(Router())
}

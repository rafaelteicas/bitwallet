//
//  BitWalletApp.swift
//  BitWallet
//
//  Created by Rafael Castro on 30/05/25.
//

import SwiftUI

@main
struct BitWalletApp: App {
    var body: some Scene {
        WindowGroup {
            AuthRoutesStack()
                .environment(Router())
        }
    }
}

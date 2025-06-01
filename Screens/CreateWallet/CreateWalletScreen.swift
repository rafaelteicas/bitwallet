//
//  CreateWalletScreen.swift
//  BitWallet
//
//  Created by Rafael Castro on 01/06/25.
//

import SwiftUI
import WalletCore

struct CreateWalletScreen: View {
    let mnemonic: String
    
    init () {
        mnemonic = HDWallet(strength: 256, passphrase: "")?.mnemonic ?? ""
    }
    
    var body: some View {
        ForEach(mnemonic.split(separator: " "), id: \.self) { word in
            Text(word)
        }
        
    }
}

#Preview {
    CreateWalletScreen()
}

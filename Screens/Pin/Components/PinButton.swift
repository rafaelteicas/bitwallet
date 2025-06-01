//
//  PinButton.swift
//  BitWallet
//
//  Created by Rafael Castro on 01/06/25.
//

import SwiftUI

struct PinButton: View {
    var number: Int?
    var icon: String?
    var action: (() -> Void)
    
    var body: some View {
        Button(action: action) {
            if let number = number {
                Text("\(number)")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 60, height: 60)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(30)
                    .foregroundColor(.primary)
            }
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 60, height: 60)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(30)
                    .foregroundColor(.primary)
            }
        }
    }
}

#Preview {
    PinButton(number: 1, icon: "person", action: {})
}

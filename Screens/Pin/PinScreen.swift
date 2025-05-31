//
//  PinScreen.swift
//  BitWallet
//
//  Created by Rafael Castro on 31/05/25.
//

import SwiftUI

struct PinScreen: View {
    @State private var pin: [String] = []
    
    var body: some View {
        VStack(spacing: 120) {
            HStack(spacing: 20) {
                ForEach(0..<6, id: \.self) { index in
                    let pinValue = pin.indices.contains(index) ? pin[index] : ""
                    
                    Circle()
                        .fill(!pinValue.isEmpty ? .black : .white)
                        .stroke(Color.gray, lineWidth: 1)
                }
            }
            .frame(height: 20)
            
            VStack {
                ForEach(0..<3, id: \.self) { row in
                    HStack {
                        ForEach(0..<3, id: \.self) { index in
                            let number = row * 3 + index
                            Button(action: {
                                pin.append("\(number + 1)")
                            }) {
                                Text("\(number + 1)")
                                    .font(.system(size: 40))
                                    .padding(.horizontal, 40)
                                    .padding(.vertical, 20)
                            }
                        }
                    }
                }
                HStack {
                    VStack {}
                        .frame(width: 40, height: 20)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                    Button (action: {
                        pin.append("0")
                    }) {
                        Text("0")
                            .font(.system(size: 40))
                            .padding(.horizontal, 40)
                            .padding(.vertical, 20)
                    }
                    Button (action: {
                        pin.removeLast()
                    }) {
                        Image(systemName: "delete.left")
                            .font(.system(size: 20))
                            .padding(.horizontal, 40)
                            .padding(.vertical, 20)
                    }
                }
            }
            .frame(width: .infinity, height: 200)
            .onChange(of: pin) { _, newValue in
                if newValue.count == 6 {
                    print(newValue)
                    pin = []
                }
            }
        }
    }
}

#Preview {
    PinScreen()
}

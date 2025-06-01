//
//  PinScreen.swift
//  BitWallet
//
//  Created by Rafael Castro on 31/05/25.
//

import SwiftUI

struct PinScreen: View {
    @Environment(Router.self) private var router
    
    @State private var enteredPin: String = ""
    @State private var step: Int = 0
    @State private var firstPin: String?
    @State private var error: Bool = false
    
    let gridItems = Array(repeating: GridItem(.fixed(100)), count: 3)
    let pinLength = 6
    
    private var isCreatePin: Bool = true
    private var nextRoute: AuthRoutes?
    
    init(isCreatePin: Bool, nextRoute: AuthRoutes?) {
        self.isCreatePin = isCreatePin
        self.nextRoute = nextRoute
    }
    
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                ForEach(0..<pinLength, id: \.self) { index in
                    Circle()
                        .fill(index < enteredPin.count ? Color.primary : Color.gray)
                        .frame(width: index < enteredPin.count ? 15 : 12)
                }
            }
            VStack(spacing: 16) {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(1...9, id: \.self) { number in
                        PinButton(number: number) {
                            handlePinInput(number)
                        }
                    }
                }
                PinButton(number: 0) {
                    handlePinInput(0)
                }
                
                if error {
                    Text("PINs do not match")
                        .foregroundColor(.red)
                        .padding()
                }
            }
        }
        .onChange(of: enteredPin) { _, pin in
            if isCreatePin && pin.count == pinLength {
                if step == 0 {
                    firstPin = pin
                    enteredPin = ""
                    step += 1
                }
                else if step == 1 {
                    if pin == firstPin {
                        guard let nextRoute else { return }
                        router.authRoutes.append(nextRoute)
                    } else {
                        error = true
                        step = 0
                        enteredPin = ""
                        firstPin = nil
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBackground)
    }
    
    private func handlePinInput(_ number: Int) {
        if enteredPin.count < pinLength {
            enteredPin.append("\(number)")
        }
    }
}

#Preview {
    PinScreen(
        isCreatePin: true,
        nextRoute: nil
    )
}

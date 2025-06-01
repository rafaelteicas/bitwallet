//
//  KeychainManager.swift
//  BitWallet
//
//  Created by Rafael Castro on 01/06/25.
//

import Foundation
import Security

class KeychainManager {
    static let shared = KeychainManager()
    
    enum KeychainKey: String {
        case userPin
    }
    
    private init() {}
    
    func save(_ data: Data, key: KeychainKey) {
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: "com.app.BitWallet",
            kSecAttrAccount: key.rawValue,
        ] as CFDictionary
        
        let status = SecItemAdd(query, nil)
        
        if status != errSecSuccess {
            print("Error: \(status)")
        }
    }
    
    func read(key: KeychainKey) -> Data? {
        let query = [
            kSecAttrService: "com.app.BitWallet",
            kSecAttrAccount: key.rawValue,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        
        return (result as? Data)
    }
    
    func delete(key: KeychainKey) {
        let query = [
            kSecAttrService: "com.app.BitWallet",
            kSecAttrAccount: key.rawValue,
            kSecClass: kSecClassGenericPassword,
            ] as CFDictionary
        
        SecItemDelete(query)
    }
}

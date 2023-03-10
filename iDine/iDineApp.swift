//
//  iDineApp.swift
//  iDine
//
//  Created by Никита Александров on 16.02.2023.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}

//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by John Reichel on 1/23/23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}

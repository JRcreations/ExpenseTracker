//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by John Reichel on 1/24/23.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack {
            List {
                //MARK: Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) { month, transaction in
                    Section {
                        //MARK: Transaction List
                        ForEach(transaction) { transaction in
                            TransactionRow(transaction: transaction)
                                .overlay(
                                    NavigationLink("", destination: {
                                        TransactionView(transaction: transaction)
                                    })
                                    .opacity(0)
                                )
                        }
                    } header: {
                        //MARK: Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        NavigationView {
            TransactionList()
                .environmentObject(transactionListVM)
        }
    }
}

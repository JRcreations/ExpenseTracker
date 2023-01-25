//
//  TransactionView.swift
//  ExpenseTracker
//
//  Created by John Reichel on 1/24/23.
//

import SwiftUI

struct TransactionView: View {
    var transaction: Transaction
    
    var body: some View {
        List {
            //MARK: Hero
            VStack(spacing: 6) {
                Text(transaction.signedAmount, format: .currency(code: "USD"))
                    .font(.largeTitle)
                    .bold()
                Text(transaction.merchant)
                    .lineLimit(1)
                Text(transaction.dateParsed, format: .dateTime.year().month(.wide).day())
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowSeparator(.hidden, edges: .top)
            .padding(.vertical, 16)
            
            //MARK: Merchant
            TransactionDetailRow(icon: .store, title: "Merchant", text: transaction.merchant)
            //MARK: Date
            TransactionDetailRow(icon: .calendar, title: "Date", text: transaction.dateParsed.formatted(.dateTime.year().month(.wide).day().weekday(.wide)))
            //MARK: Financial Instituion
            TransactionDetailRow(icon: .landmark, title: "Financial Institution", text: transaction.institution)
            //MARK: Account
            TransactionDetailRow(icon: .credit_card, title: "Account", text: transaction.account)
            //MARK: Category
            NavigationLink {
                CategoriesView(transaction: transaction)
            } label: {
                TransactionDetailRow(icon: .list, title: "Category", text: transaction.categoryItem.name)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Transaction")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransactionView(transaction: transactionPreviewData)
        }
    }
}

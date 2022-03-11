//
//  ContentView.swift
//  numbering
//
//  Created by 최형우 on 2022/03/11.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: CounterViewModel = .init()
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
                .font(.largeTitle)
                .foregroundColor(checkResultColor(viewModel.checkResults))
            
            HStack{
                Spacer()
                Button {
                    viewModel.apply(.incresement)
                } label: {
                    Text("+")
                        .font(.title)
                        .foregroundColor(.black)
                }
                Spacer()
                Button {
                    viewModel.apply(.decresement)
                } label: {
                    Text("-")
                        .font(.title)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            Button {
                viewModel.apply(.restart)
            } label: {
                Text("Reset")
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .padding(.top, 10)
        }
    }
    
    func checkResultColor(_ check: CheckResults) -> Color {
        switch check {
        case .lower:
            return .red
        case .equal:
            return .green
        case .heigher:
            return .blue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

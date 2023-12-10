//
//  ContentView.swift
//  Choose a letter
//
//  Created by Thiago Marafon on 09/12/23.
//

import SwiftUI

struct WordGameView: View {
    @ObservedObject var viewModel = WordGameViewModel()

    var body: some View {
        VStack {
            Image(viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            Text(viewModel.displayWord)
                .font(.largeTitle)

            HStack {
                ForEach(viewModel.choices, id: \.self) { choice in
                    Button(String(choice)) {
                        // Add action to handle choice selection
                    }
                    .font(.title)
                    .padding()
                }
            }
        }
        .onAppear {
            viewModel.selectRandomWord()
        }
    }
}


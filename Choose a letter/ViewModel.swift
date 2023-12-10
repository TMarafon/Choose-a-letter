import SwiftUI

class WordGameViewModel: ObservableObject {
    @Published var wordItems: [WordItem] = [
        WordItem(word: "apple", image: "apple"),
        WordItem(word: "ball", image: "ball"),
        // ... add more items
    ]

    @Published var currentWord: String = ""
    @Published var displayWord: String = ""
    @Published var choices: [Character] = []
    @Published var image: String = ""

    func selectRandomWord() {
        guard let selectedWord = wordItems.randomElement() else { return }
        currentWord = selectedWord.word
        image = selectedWord.image
        prepareWordForDisplay()
    }

    private func prepareWordForDisplay() {
        guard !currentWord.isEmpty else { return }

        let missingLetterIndex = Int.random(in: 0..<currentWord.count)
        let letterArray = Array(currentWord)
        let missingLetter = letterArray[missingLetterIndex]

        var displayArray = letterArray
        displayArray[missingLetterIndex] = "_"
        displayWord = String(displayArray)

        choices = generateLetterChoices(missingLetter: missingLetter)
    }


    private func generateLetterChoices(missingLetter: Character) -> [Character] {
        var choices = [missingLetter]
        // Add two more random letters to 'choices', ensuring they are different from 'missingLetter'
        return choices.shuffled()
    }
}

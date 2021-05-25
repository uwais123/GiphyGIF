//
//  SearchViewModel.swift
//  GiphyGIF
//
//  Created by Uwais Alqadri on 23/05/21.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {

  private let searchUseCase: SearchUseCase

  private var cancellables: Set<AnyCancellable> = []
  @Published var giphys: [Giphy] = []
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  @Published var searchText: String = String()

  init(searchUseCase: SearchUseCase) {
    self.searchUseCase = searchUseCase

    $searchText
      .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
      .removeDuplicates()
      .map { string in
        if string.count < 1 {
          self.giphys = []
          return nil
        }
        return string
      }
      .compactMap { $0 }
      .sink { (_) in

      } receiveValue: { searchField in
        self.getSearchGiphy(query: searchField)

      }.store(in: &cancellables)
  }

  func getSearchGiphy(query: String) {
    self.loadingState = true
    searchUseCase.getSearchGiphy(query: query)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
          print(self.errorMessage)
        case .finished:
          self.loadingState = false
        }
      }, receiveValue: { result in
        self.giphys = result
      }).store(in: &cancellables)
  }
}

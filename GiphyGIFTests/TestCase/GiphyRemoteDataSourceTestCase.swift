//
//  GiphyTrendingTestCase.swift
//  GiphyTrendingTestCase
//
//  Created by Uwais Alqadri on 06/06/21.
//

@testable import GiphyGIF
@testable import Giphy
@testable import Core
import Combine
import XCTest

typealias DummyGetGiphyInteractor = Interactor<
  Int, [Giphy], GetGiphyRepository<
    DummyRemoteDataSource
  >
>

class GiphyRemoteDataSourceTestCase: XCTestCase {

  func testMockGetTrendingUseCase() async throws {
    let useCase: DummyGetGiphyInteractor = TestInjection().resolve()
    let result = try await useCase.execute(request: 0)
    XCTAssertEqual(result.compactMap({ $0.title }).first, "Happy Anniversary Love GIF by Hallmark Gold Crown")
  }
}

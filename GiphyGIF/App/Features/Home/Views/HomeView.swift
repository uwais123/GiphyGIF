//
//  HomeView.swift
//  GiphyGIF
//
//  Created by Uwais Alqadri on 24/05/21.
//

import SwiftUI

struct HomeView: View {

  let viewModel: HomeViewModel

  init(viewModel: HomeViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    Text("Home View")
      .onAppear {
        viewModel.getTrendingGiphy()
      }
  }
}

//struct HomeView_Previews: PreviewProvider {
//  static var previews: some View {
//    HomeView()
//  }
//}

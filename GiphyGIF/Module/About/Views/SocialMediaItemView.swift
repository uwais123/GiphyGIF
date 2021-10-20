//
//  SocialMediaItemView.swift
//  GiphyGIF
//
//  Created by Uwais Alqadri on 29/05/21.
//

import SwiftUI
import Common

struct SocialMediaItemView: View {
  var image: String
  var name: String

  var body: some View {
    HStack {
      Image(uiImage: CommonImage(named: image))
        .resizable()
        .frame(width: 27, height: 27)
      Text(name)
        .font(.system(size: 18))
    }
  }
}

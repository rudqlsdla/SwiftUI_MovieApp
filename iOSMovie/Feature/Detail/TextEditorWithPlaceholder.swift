//
//  TextEditorWithPlaceholder.swift
//  iOSMovie
//
//  Created by 임경빈 on 2/29/24.
//

import SwiftUI

struct TextEditorWithPlaceholder: View {
  @Binding var text: String
  
  var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty {
        VStack {
          Text("Write something...")
            .padding(.top, 15)
            .padding(.leading, 12)
            .opacity(0.6)
          Spacer()
        }
      }
      
      VStack {
        TextEditor(text: $text)
          .font(.system(size: 14, weight: .medium))
          .lineSpacing(5)
          .frame(maxHeight: .infinity)
          .opacity(text.isEmpty ? 0.85 : 1)
          .padding(5)
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(.grayF0F0F0, lineWidth: 2)
          )        
        Spacer()
      }
    }
  }
}

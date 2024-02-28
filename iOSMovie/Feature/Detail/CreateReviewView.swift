//
//  CreateReviewView.swift
//  iOSMovie
//
//  Created by 임경빈 on 2/28/24.
//

import SwiftUI

struct CreateReviewView: View {
  @State private var rank: Int = 0
  @State private var reviewText = ""
  
  let movieTitle: String
  @Binding var isPresented: Bool
  
  var body: some View {
    VStack {
      HStack() {
        Button {
          isPresented = false
        } label: {
          Image(systemName: "xmark")
          Spacer()
        }
      }
      .padding()
      
      VStack(spacing: 2) {
        Text("How was the")
          .font(.system(size: 20, weight: .semibold))
        Text("\(movieTitle)?")
          .font(.system(size: 28, weight: .bold))
          .foregroundStyle(.blue1112AF)
      }
      
      HStack {
        ForEach(0..<5) { index in
          Button {
            rank = index+1
            print(rank)
          } label: {
            Image(systemName: "star.fill")
              .foregroundStyle(index < rank ? .yellow : .grayF0F0F0)
          }
        }
      }
      .padding(.top, 8)
      
      VStack(spacing: 10) {
        MovieEvaluationView(evaluationItem: "Performance")
        MovieEvaluationView(evaluationItem: "Story")
        MovieEvaluationView(evaluationItem: "Sound")
        
        
        HStack {
          Text("Record")
            .font(.system(size: 18, weight: .medium))
          Spacer()
        }
        TextEditor(text: $reviewText)
          .padding(5)
          .foregroundColor(.black)
          .font(.system(size: 14, weight: .medium))
          .lineSpacing(5)
          .border(.grayF0F0F0, width: 2)
          .frame(maxHeight: 150)
      }
      .padding(20)
      
      Button {
        //리뷰 저장
      } label: {
        Text("Save")
          .font(.system(size: 18, weight: .medium))
          .padding()
          .frame(maxWidth: .infinity)
          .background(.grayF0F0F0)
      }
      .padding(.horizontal, 20)
      Spacer()
    }
  }
}

extension CreateReviewView {
  struct MovieEvaluationView: View {
    let evaluationItem: String
    var body: some View {
      VStack {
        HStack {
          Text(evaluationItem)
            .font(.system(size: 18, weight: .medium))
          Spacer()
        }
        HStack(spacing: -1) {
          EvaluationButton(title: "bad")
          EvaluationButton(title: "soso")
          EvaluationButton(title: "good")
        }
      }
    }
  }
  
  struct EvaluationButton: View {
    let title: String
    var body: some View {
      Button {
        
      } label: {
        Text(title)
          .padding(.vertical, 10)
          .frame(maxWidth: .infinity)
          .border(.grayF0F0F0, width: 1)
      }
    }
  }
}

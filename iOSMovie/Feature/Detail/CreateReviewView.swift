//
//  CreateReviewView.swift
//  iOSMovie
//
//  Created by 임경빈 on 2/28/24.
//

import RealmSwift
import SwiftUI

struct CreateReviewView: View {
  @Environment(\.realm) var realm
  @State private var rank: Int = 0
  @State private var reviewText = ""
  @State private var reviewData = ReviewData()
  
  let movieTitle: String
  let posterURL: String
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
            reviewData.rating = rank
            print(rank)
          } label: {
            Image(systemName: "star.fill")
              .foregroundStyle(index < rank ? .yellow : .grayF0F0F0)
          }
        }
      }
      .padding(.top, 8)
      
      VStack(spacing: 10) {
        MovieEvaluationView(reviewData: $reviewData, evaluationItem: .performance)
        MovieEvaluationView(reviewData: $reviewData, evaluationItem: .story)
        MovieEvaluationView(reviewData: $reviewData, evaluationItem: .sound)
        
        
        HStack {
          Text("Record")
            .font(.system(size: 18, weight: .medium))
          Spacer()
        }
        TextEditorWithPlaceholder(text: $reviewText)
//        TextEditor(text: $reviewText)
//          .padding(5)
//          .font(.system(size: 14, weight: .medium))
//          .lineSpacing(5)
//          .overlay(
//                   RoundedRectangle(cornerRadius: 10)
//                    .stroke(.grayF0F0F0, lineWidth: 2)
//                   )
//          .frame(maxHeight: .infinity)
      }
      .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
      
      Button {
        //리뷰 저장
        let reviewSection = ReviewSection()
        reviewSection.title = movieTitle
        reviewSection.posterURL = posterURL
        reviewSection.rating = reviewData.rating
        reviewSection.performance = reviewData.performance
        reviewSection.story = reviewData.story
        reviewSection.sound = reviewData.sound
        reviewSection.record = reviewData.record
        try? realm.write {
          realm.add(reviewSection)
          isPresented = false
        }
      } label: {
        Text("Save")
          .font(.system(size: 18, weight: .medium))
          .foregroundStyle(reviewData.isCompleted ? .white : .black)
          .padding(.top, 10)
          .padding(.bottom, 30)
          .frame(maxWidth: .infinity)
          .background(reviewData.isCompleted ? .blue : .grayF0F0F0)
          .clipShape(.rect(topLeadingRadius: 10, topTrailingRadius: 10))
      }
      .padding(.horizontal, 20)
      .disabled(!reviewData.isCompleted)
    }
    .ignoresSafeArea(.all)
  }
}

extension CreateReviewView {
  struct MovieEvaluationView: View {
    @Binding var reviewData: ReviewData
    let evaluationItem: EvaluationItem
    
    var body: some View {
      VStack {
        HStack {
          Text(evaluationItem.title)
            .font(.system(size: 18, weight: .medium))
          Spacer()
        }
        HStack(spacing: -0.5) {
          EvaluationButton(reviewData: $reviewData, item: evaluationItem, type: .bad, isFirst: true)
          EvaluationButton(reviewData: $reviewData, item: evaluationItem, type: .soso)
          EvaluationButton(reviewData: $reviewData, item: evaluationItem, type: .good, isEnd: true)
        }
      }
    }
  }
  
  struct EvaluationButton: View {
    @Binding var reviewData: ReviewData
    let item: EvaluationItem
    let type: EvaluationType
    var isFirst = false
    var isEnd = false
    
    var body: some View {
      Button {
        evaluateItem()
      } label: {
        Text(type.title)
          .padding(.vertical, 10)
          .frame(maxWidth: .infinity)
          .foregroundStyle(.black)
          .background {
            switch item {
            case .performance:
              reviewData.performance == type ? Color.blue : Color.clear
            case .story:
              reviewData.story == type ? Color.blue : Color.clear
            case .sound:
              reviewData.sound == type ? Color.blue : Color.clear
            }
          }
          .roundedCornerWithBorder(lineWidth: 1, borderColor: .grayF0F0F0, radius: 20, corners: isFirst || isEnd ? isFirst ? [.topLeft, .bottomLeft] : [.topRight, .bottomRight] : [])
      }
    }
    
    func evaluateItem() {
      switch item {
      case .performance:
        reviewData.performance = type
      case .story:
        reviewData.story = type
      case .sound:
        reviewData.sound = type
      }
    }
  }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCornerWithBorder(lineWidth: CGFloat, borderColor: Color, radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
            .overlay(RoundedCorner(radius: radius, corners: corners)
                .stroke(borderColor, lineWidth: lineWidth))
    }
}

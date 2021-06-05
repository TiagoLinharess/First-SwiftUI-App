//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by inchurch on 05/06/21.
//

import SwiftUI

struct ContentView: View {
  @State private var students: [Student] = [
    Student(name: "Harry", id: 1),
    Student(name: "Hermione", id: 2),
    Student(name: "Ron", id: 3),
  ]
  
  @State private var selectedStudent = 0
  
  func selectStudent(_ studentId: Int) {
    selectedStudent = studentId
  }
  
  func findStudent() -> String {
    guard let student = students.first(where: {$0.id == selectedStudent}) else {
      return "Select your student."
    }
    return "The selected student is \(student.name)."
  }
  
  var body: some View {
    Form {
      ForEach(0 ..< students.count) { row in
        Text("Name: \(students[row].name)").onTapGesture {
          selectStudent(students[row].id)
        }
      }
      
      Section {
        Text(findStudent())
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

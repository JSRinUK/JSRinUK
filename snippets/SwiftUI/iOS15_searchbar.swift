//
//  ContentView.swift
//  SearchBar
//
//  Created by Jonathan Rudderham on 10/03/2022.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var model: DataUtils // change to own model
  @State private var searchText = ""
  
  var body: some View {
    NavigationView {
      List {
        ForEach(searchResults) { data in 
                                // change to suit
                                NavigationLink(data.title,
                                       destination: VideoScreen(video: data))
                        
        }
      }
      .navigationTitle(Text("Results:"))
    }
    .searchable(text: $searchText)
  }
  
  var searchResults: [DataModel] {
    if searchText.isEmpty {
      return model.jsonDataFile // change to own property
    } else {
      return model.jsonDataFile.filter { $0.title.contains(searchText)}
    }
  }
  
}


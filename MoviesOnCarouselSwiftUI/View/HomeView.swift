//
//  HomeView.swift
//  MoviesOnCarouselSwiftUI
//
//  Created by Mathias Nonohay on 20/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var currentTab: Tab = .home
    @Namespace var animation
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 15) {
            HeaderView()
            
            SearchBar()
            
            (Text("Featured")
                .fontWeight(.semibold) +
            Text(" Movies"))
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 15)
            
            CustomCarouselView(index: $currentIndex, items: movies, cardPadding: 150, id: \.id) { movie, cardSize in
                // MARK: Custom view cell
                Image(movie.artWork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardSize.width, height: cardSize.height)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
            .padding(.horizontal, -15)
            .padding(.vertical)
            
            TabBar()
        }
        .padding([.horizontal, .top], 15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background {
            GeometryReader { proxy in
                let size = proxy.size
                
                TabView(selection: $currentIndex) {
                    ForEach(movies.indices, id: \.self) { index in
                        Image(movies[index].artWork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .clipped()
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentIndex)
                
                Rectangle()
                    .fill(.ultraThinMaterial)
                
                LinearGradient(colors: [
                    .clear,
                    .gray
                ], startPoint: .topLeading, endPoint: .bottom)
            }
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                VStack(spacing: -2) {
                    Image(systemName: tab.rawValue)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 28)
                        .foregroundColor(currentTab == tab ? .white : .black.opacity(0.6))
                    if currentTab == tab {
                        Circle()
                            .fill(.white)
                            .frame(width: 5, height: 5)
                            .offset(y: 10)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        currentTab = tab
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    @ViewBuilder
    func SearchBar() -> some View {
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            
            TextField("Search", text: .constant(""))
                .padding(.vertical, 10)
            
            Image(systemName: "mic")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.white.opacity(0.12))
        }
        .padding(.top, 20)
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                (Text("Hello")
                    .fontWeight(.semibold) +
                Text(" Mathias"))
                
                Text("Book your favorite movie")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                
            } label: {
                Image("profilePic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  WebView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 19.11.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView( )
        view.load(URLRequest (url: url))
        return view
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

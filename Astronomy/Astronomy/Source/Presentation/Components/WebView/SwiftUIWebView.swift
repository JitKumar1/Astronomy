//
//  SwiftUIWebView.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
    
    /// web view url string
    var url: URL?
    
    /// A Boolean value that determines whether scrolling is enabled.
    var isScrollEnabled: Bool = false
    
    /// web url loading state
    @Binding var isLoading: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) ->  WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        if let url {
            webView.load(URLRequest(url: url))
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.scrollView.isScrollEnabled = isScrollEnabled
    }
}

extension SwiftUIWebView {
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
        var parent: SwiftUIWebView
        
        init(_ parent: SwiftUIWebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
        }
        
    }
}

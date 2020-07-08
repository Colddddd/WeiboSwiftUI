//
//  ScrollViewController.swift
//  WeiboUI
//
//  Created by 梁涛 on 2020/7/8.
//  Copyright © 2020 zzz. All rights reserved.
//  将 SWiftUI view  加入到 UIkit

import SwiftUI

struct ScrollViewController<Content: View>: UIViewControllerRepresentable {
    let pageW: CGFloat
    let contentSize: CGSize
    let content: Content
    @Binding var precent: CGFloat // 不用给初始值了

    init(pageW: CGFloat, contentSize: CGSize, precent: Binding<CGFloat>  ,@ViewBuilder content: () -> Content) {
        self.pageW = pageW
        self.contentSize = contentSize
        self.content = content()
        self._precent = precent
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        let scrollView = context.coordinator.scorllView!
        scrollView.frame = CGRect(x: 0, y: 0, width: pageW, height: contentSize.height)
        scrollView.contentSize = contentSize
        scrollView.setContentOffset(CGPoint(x: precent * (contentSize.width - pageW), y: 0), animated: true)
        context.coordinator.host.view.frame = CGRect(origin: .zero, size: contentSize)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = context.coordinator
        context.coordinator.scorllView = scrollView

        let vc = UIViewController()
        vc.view.addSubview(scrollView)

        let host = UIHostingController(rootView: content)
        vc.addChild(host)
        scrollView.addSubview(host.view)
        host.didMove(toParent: vc)
        context.coordinator.host = host
        return vc
    }

    class Coordinator: NSObject, UIScrollViewDelegate {
        let parent: ScrollViewController
        var scorllView: UIScrollView!
        var host: UIHostingController<Content>!

        init(_ parent: ScrollViewController) {
            self.parent = parent
        }

        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            withAnimation {
                parent.precent = scrollView.contentOffset.x < parent.pageW * 0.5 ? 0 : 1
            }
        }
    }
}


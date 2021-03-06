# JWSWebViewSample
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/clintjang/JWSBoltsSwiftSample/blob/master/LICENSE) [![Swift 4](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://swift.org) [![objective-c](https://img.shields.io/badge/objective_c-1.0-orange.svg?style=flat)](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)

- Link 1-En (Good): [WKWebView: Differences from UIWebView browsing engine](http://docs.kioskproapp.com/article/840-wkwebview-supported-features-known-issues#requires-ios9)
- Link 1-Ko (Good): [UIWebView와 WKWebView의 차이](http://zeddios.tistory.com/332)
- Link 2: [What's the difference between UIWebView and WKWebView?](https://www.hackingwithswift.com/example-code/wkwebview/whats-the-difference-between-uiwebview-and-wkwebview)


## Requirements
- Minimum iOS Target : iOS 9.0
- Minimum Xcode Version : Xcode 9.0
- This Sample Project : Xcode 9.2
(Because of "Self Area")

## Description
- This is the WebView Sample source. Both UIWebView and WKWebView can be checked together.You can also check the Swift source and Objective-C source.

- This is the default project swift. You can also test with objective-c by adding an objective-c source inside. Public data was managed by appdelegate.swift.

- It is easy to check the execution result of UIWebView and WKWebView.

- An example of using objective-c in swift, and an example of using the swift source in objective-c.


# Info
## Result Image

<table style="width:100%">
  <tr>
	<th>structure</th> 
    <th>objective-c</th>
    <th>swift</th> 
  </tr>
  <tr>
  	<td><img width="268" height="480" src="/Image/structure_00.png"></img></td>
    <td><img width="268" height="480" src="/Image/objectivec_gif_00.gif"></img></td>
    <td><img width="268" height="480" src="/Image/swift_gif_00.gif"></img></td> 
  </tr>
</table>



## Source
- AppDelegate.swift

```swift
... 
    // Change your test URL here.
    private let urlString = "http://www.github.com"

    // For convenience, I created it in "appdelegate". This is whether or not "URL" is selected.
    @objc var isURL:Bool = false
    
    @objc var url:URL? {
        return URL(string: urlString)
    }
...
```

- swift 
	- WKWebView : SwiftWKWebViewController.swift
	- UIWebView : SwiftUIWebViewController.swift
- objective-c
	- WKWebView : ObjectiveCWKWebViewViewController.h , .m
	- UIWebView : ObjectiveCUIWebViewViewController.h , .m

- sample.html
<img width="634" height="237" src="/Image/sample_html_00.png"> 

## Apple Link
- WKWebView : https://developer.apple.com/documentation/webkit/wkwebview
- UIWebView : https://developer.apple.com/documentation/uikit/uiwebview

## Using Swift And Objective-C together
- Swift
<table style="width:100%">
  <tr>
	<th>Packaging, Defines Module : YES</th> 
    <th>Import "yourprojectname-Swift.h"</th>
  </tr>
  <tr>
  	<td><img width="440" height="120" src="/Image/use_swift_00.png"></img></td>
    <td><img width="357" height="60" src="/Image/use_swift_01.png"></img></td>
  </tr>
</table>

- Objective-C, Bridging Header Setting

<img width="453" height="118" src="/Image/use_objectivec.png"></img>

## Safe Area
- Also available on iPhone X
- https://developer.apple.com/documentation/uikit/uiview/positioning_content_relative_to_the_safe_area

<table style="width:100%">
  <tr>
	<th>iPhone X Sample View 1</th> 
    <th>iPhone X Sample View 2</th>
  </tr>
  <tr>
  	<td><img width="317" height="665" src="/Image/iPhoneX_safe_area_01.png"></img></td>
    <td><img width="317" height="665" src="/Image/iPhoneX_safe_area_00.png"></img></td>
  </tr>
</table>

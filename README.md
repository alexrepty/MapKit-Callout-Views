MapKit Delegates
================

Purpose
-------

Originally a piece of sample code for my talk entitled "What You Absolutely Cannot Do With MapKit", this example serves to illustrate how to add a custom callout view to an `MKAnnotationView`.

Explanation
-----------

This example shows how to avoid using the built-in callout views in MapKit. As those built-in views don't provide a lot of configurability, this approach serves as a starting point for developers to build and include their own callout views.

What's Missing
--------------

* Animation - the original callout view has a pop animation when added and a fade animation when removed from the view. Nick Farina's [SMCalloutView](https://github.com/nfarina/calloutview) has a great implementation of those animations.

* Positioning and an arrow/pointer - again, Nick Farina has [re-created this in painstaking detail](http://nfarina.com/post/29883229869/callout-view).

* Event handling - chances are that, out of the box, the custom callout view shown in this example wouldn't receive any touch events. The built-in callout view uses another subview that covers the entire `MKMapView` to solve this, plus possibly an overridden version of `-hitTest:withEvent:` to be able to handle touch events outside its bounds.

Scope
-----

The included Xcode project is ready to build in Xcode 5 and iOS 7.

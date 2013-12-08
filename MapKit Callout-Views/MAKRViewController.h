//
//  MAKRViewController.h
//  MapKit Callout-Views
//
//  Created by Alexander Repty on 08.12.13.
//  Copyright (c) 2013 alexrepty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MAKRViewController : UIViewController <MKMapViewDelegate>

@property(nonatomic,strong) IBOutlet MKMapView *mapView;

@end

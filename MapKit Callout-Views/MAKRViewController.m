//
//  MAKRViewController.m
//  MapKit Callout-Views
//
//  Created by Alexander Repty on 08.12.13.
//  Copyright (c) 2013 alexrepty. All rights reserved.
//

#import "MAKRViewController.h"

#import "MAKRSampleAnnotation.h"

@implementation MAKRViewController

#pragma mark -
#pragma mark UIViewController Methods

- (void)viewDidLoad {
	MAKRSampleAnnotation *annotation = [MAKRSampleAnnotation new];
	annotation.coordinate = CLLocationCoordinate2DMake(52.525923, 13.411399);
	annotation.title = @"Kino Babylon";
	annotation.subtitle = @"Rosa-Luxemburg-Str. 30, 10178 Berlin";
	
	[self.mapView addAnnotation:annotation];
	
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 1000.0, 1000.0);
	[self.mapView setRegion:region];
}

@end

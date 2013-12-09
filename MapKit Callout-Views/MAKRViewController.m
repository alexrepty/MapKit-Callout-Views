//
//  MAKRViewController.m
//  MapKit Callout-Views
//
//  Created by Alexander Repty on 08.12.13.
//  Copyright (c) 2013 alexrepty. All rights reserved.
//

#import "MAKRViewController.h"

#import "MAKRSampleAnnotation.h"
#import "MAKRCalloutView.h"

NSString *const kMAKRViewControllerMapAnnotationViewReuseIdentifier = @"MAKRViewControllerMapAnnotationViewReuseIdentifier";

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

#pragma mark -
#pragma mark MKMapViewDelegate Methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:kMAKRViewControllerMapAnnotationViewReuseIdentifier];
	return view;
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
	for (MKAnnotationView *annotationView in views) {
		annotationView.canShowCallout = NO;
	}
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
	MAKRCalloutView *calloutView = [[MAKRCalloutView alloc] initWithFrame:CGRectMake(0.0, 0.0, 242.0, 57.0)];
	
	calloutView.titleLabel.text = view.annotation.title;
	calloutView.subtitleLabel.text = view.annotation.subtitle;
	calloutView.informationLabel.text = @"Today: AltTechTalks";
	
	calloutView.center = CGPointMake(CGRectGetWidth(view.bounds) / 2.0, 0.0);
	[view addSubview:calloutView];
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
	for (UIView *subview in view.subviews) {
		if (![subview isKindOfClass:[MAKRCalloutView class]]) {
			continue;
		}
		
		[subview removeFromSuperview];
	}
}

@end

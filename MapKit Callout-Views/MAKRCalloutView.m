//
//  MAKRCalloutView.m
//  MapKit Callout-Views
//
//  Created by Alexander Repty on 09.12.13.
//  Copyright (c) 2013 alexrepty. All rights reserved.
//

#import "MAKRCalloutView.h"

@implementation MAKRCalloutView

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.titleLabel = ({
			UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
			label.backgroundColor = [UIColor clearColor];
			label.font = [UIFont systemFontOfSize:17.0];
			label.translatesAutoresizingMaskIntoConstraints = NO;
			label;
		});
		[self addSubview:self.titleLabel];
		
		self.subtitleLabel = ({
			UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
			label.backgroundColor = [UIColor clearColor];
			label.font = [UIFont systemFontOfSize:12.0];
			label.translatesAutoresizingMaskIntoConstraints = NO;
			label;
		});
		[self addSubview:self.subtitleLabel];
		
		self.informationLabel = ({
			UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
			label.backgroundColor = [UIColor clearColor];
			label.font = [UIFont systemFontOfSize:12.0];
			label.textColor = [UIColor darkGrayColor];
			label.translatesAutoresizingMaskIntoConstraints = NO;
			label;
		});
		[self addSubview:self.informationLabel];
		
		NSDictionary *viewMetrics = @{@"bigLabelHeight": @(21.0),
									  @"smallLabelHeight": @(15.0),
									  @"labelWidth": @(216.0),
									  @"horizontalPadding": @(13.0),
									  @"verticalPadding": @(3.0),
									  @"verticalSpacing": @(0.0)};
		id titleLabel = self.titleLabel;
		id subtitleLabel = self.subtitleLabel;
		id informationLabel = self.informationLabel;
		NSDictionary *views = NSDictionaryOfVariableBindings(titleLabel, subtitleLabel, informationLabel);
		
		NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-verticalPadding-[titleLabel(bigLabelHeight)]-verticalSpacing-[subtitleLabel(smallLabelHeight)]-verticalSpacing-[informationLabel(smallLabelHeight)]-verticalPadding-|"
																						 options:0
																						 metrics:viewMetrics
																						   views:views];
		[self addConstraints:verticalConstraints];
		
		NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-horizontalPadding-[titleLabel(labelWidth)]-horizontalPadding-|"
																				 options:0
																				 metrics:viewMetrics
																				   views:views];
		horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|-horizontalPadding-[subtitleLabel(labelWidth)]-horizontalPadding-|"
																												   options:0
																												   metrics:viewMetrics
																													 views:views]];
		horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|-horizontalPadding-[informationLabel(labelWidth)]-horizontalPadding-|"
																												   options:0
																												   metrics:viewMetrics
																													 views:views]];
		[self addConstraints:horizontalConstraints];
		
		self.layer.anchorPoint = CGPointMake(0.5, 1.0);
		self.layer.backgroundColor = [UIColor whiteColor].CGColor;
		self.layer.borderColor = [UIColor colorWithRed:0.890 green:0.875 blue:0.843 alpha:1.000].CGColor;
		self.layer.borderWidth = 0.5;
		self.layer.cornerRadius = 8.0;
		self.layer.masksToBounds = YES;
	}
	return self;
}

@end

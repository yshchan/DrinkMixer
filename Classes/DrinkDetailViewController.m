//
//  DrinkDetailViewController.m
//  DrinkMixer
//
//  Created by Gustavo Barbosa on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DrinkDetailViewController.h"
#import "DrinkConstants.h"


@implementation DrinkDetailViewController

@synthesize drink;
@synthesize scrollView;
@synthesize nameTextField, ingredientsTextView, directionsTextView;

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	nameTextField.text = [drink objectForKey:NAME_KEY];
	ingredientsTextView.text = [drink objectForKey:INGREDIENTS_KEY];
	directionsTextView.text = [drink objectForKey:DIRECTIONS_KEY];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	scrollView.contentSize = self.view.frame.size;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[drink release];
	[scrollView release];
	[nameTextField release];
	[ingredientsTextView release];
	[directionsTextView release];
    [super dealloc];
}

@end

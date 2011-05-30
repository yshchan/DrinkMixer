//
//  DrinkDetailViewController.h
//  DrinkMixer
//
//  Created by Gustavo Barbosa on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrinkDetailViewController : UIViewController {
	NSDictionary *drink;
	IBOutlet UITextField *nameTextField;
	IBOutlet UITextView *ingredientsTextView;
	IBOutlet UITextView *directionsTextView;
}

@property (nonatomic, retain) NSDictionary *drink;
@property (nonatomic, retain) IBOutlet UITextField *nameTextField;
@property (nonatomic, retain) IBOutlet UITextView *ingredientsTextView;
@property (nonatomic, retain) IBOutlet UITextView *directionsTextView;

@end
//
//  AddDrinkViewController.h
//  DrinkMixer
//
//  Created by Gustavo Barbosa on 5/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrinkDetailViewController.h"

@interface AddDrinkViewController : DrinkDetailViewController {
	BOOL keyboardVisible;
	NSMutableArray *drinkArray;
}

@property (nonatomic, retain) NSMutableArray *drinkArray;

- (IBAction)save: (id)sender;
- (IBAction)cancel: (id)sender;
- (void)keyboardDidShow: (NSNotification *)notification;
- (void)keyboardDidHide: (NSNotification *)notification;

@end

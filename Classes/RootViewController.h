//
//  RootViewController.h
//  DrinkMixer
//
//  Created by Gustavo Barbosa on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSMutableArray *drinks;
	IBOutlet UIBarButtonItem *addButtonItem;
}

@property (nonatomic, retain) NSMutableArray *drinks;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *addButtonItem;

- (IBAction) addButtonPressed:(id)sender;

@end

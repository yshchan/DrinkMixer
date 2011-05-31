    //
//  AddDrinkViewController.m
//  DrinkMixer
//
//  Created by Gustavo Barbosa on 5/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddDrinkViewController.h"
#import "DrinkConstants.h"

@implementation AddDrinkViewController

@synthesize drinkArray;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] 
											  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
											  target:self 
											  action:@selector(cancel:)] 
											 autorelease];
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
											   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
											   target:self 
											   action:@selector(save:)]
											  autorelease];
}

- (IBAction)save:(id)sender {
	NSLog(@"Save pressed!");
	
	NSMutableDictionary *newDrink = [[NSMutableDictionary alloc] init];
	[newDrink setValue:nameTextField.text forKey:NAME_KEY];
	[newDrink setValue:ingredientsTextView.text forKey:INGREDIENTS_KEY];
	[newDrink setValue:directionsTextView forKey:DIRECTIONS_KEY];
	[drinkArray addObject:newDrink];
	
	[newDrink release];
	
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)cancel:(id)sender {
	NSLog(@"Cancel pressed!");
	[self dismissModalViewControllerAnimated:YES];
}

- (void)keyboardDidShow:(NSNotification *)notification {
	NSLog(@"Receveid UIKeyboardDidShowNotification");
	
	if (keyboardVisible) {
		NSLog(@"Keyboard already visible. Ignoring notification.");
		return;
	}
	
	// O teclado não estava visivel antes
	NSLog(@"Resizing smaller for keyboard");
	
	// Obtenha o tamanho do teclado
	NSDictionary *info = [notification userInfo];
	NSValue *aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
	
	// Redimensiona a scroll view para abrir espaço para o teclado
	CGRect viewFrame = self.view.frame;
	viewFrame.size.height -= keyboardSize.height;
	
	scrollView.frame = viewFrame;
	keyboardVisible = YES;
}

- (void)keyboardDidHide:(NSNotification *)notification {
	NSLog(@"Received UIKeyboardDidHideNotification");
	
	if (!keyboardVisible) {
		NSLog(@"Keyboard already hidden. Ignoring notification.");
		return;
	}
	
	// O teclado estava visivel antes
	NSLog(@"Resizing bigger for keyboard");
	
	// Obtenha o tamanho do teclado
	NSDictionary *info = [notification userInfo];
	NSValue *aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
	
	// Redimensiona a scroll view para seu tamanho original
	CGRect viewFrame = self.view.frame;
	viewFrame.size.height += keyboardSize.height;
	
	scrollView.frame = viewFrame;
	keyboardVisible = NO;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSLog(@"Registering for keyboard events");
	[[NSNotificationCenter defaultCenter] addObserver:self 
										  selector:@selector(keyboardDidShow:) 
										  name:UIKeyboardDidShowNotification 
										  object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self 
										  selector:@selector(keyboardDidHide:) 
										  name:UIKeyboardDidHideNotification 
										  object:nil];
	keyboardVisible = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	NSLog(@"Unregistering for keyboard events");
	[[NSNotificationCenter defaultCenter] removeObserver:self];
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
	[drinkArray release];
    [super dealloc];
}


@end

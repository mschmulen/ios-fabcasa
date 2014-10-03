//
//  SecondViewController.m
//  messaging
//
//  Created by Matthew Schmulen on 9/27/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

#import "LocalMessageViewController.h"

@interface LocalMessageViewController () < UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *messageView;
@property (weak, nonatomic) IBOutlet UIView *headerView;

@property (strong, nonatomic) NSMutableArray* tableData;

@end

@implementation LocalMessageViewController

- (NSMutableArray* ) tableData
{
    if(!_tableData){
        _tableData = [[NSMutableArray alloc] initWithArray:@[@"message1", @"message2"]];
    }
    return _tableData;
}

- (IBAction)actionRefresh:(id)sender {
    NSLog(@"Refresh");
}

- (IBAction)actionSendButton:(id)sender {
    NSLog(@"Action Send");
    
    //Send the message
    NSString *message = [self.textView.text copy];
    
    [self.tableData addObject:message];
    
    //Clear the message from the field
    self.textView.text = @"";
    [self.textView resignFirstResponder];
    
    [self.tableView reloadData];
    
}

- (IBAction)actionCancelButton:(id)sender {
    NSLog(@"Action Left Button");
    
    //Cancel post
    self.textView.text = @"";
    [self.textView resignFirstResponder];
    
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerForKeyboardNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerForKeyboardNotifications
{
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)n
{
    NSDictionary* userInfo = [n userInfo];
    
    // get the size of the keyboard
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    /*
     // resize the noteView
     CGRect viewFrame = self.scrollView.frame;
     // I'm also subtracting a constant kTabBarHeight because my UIScrollView was offset by the UITabBar so really only the portion of the keyboard that is leftover pass the UITabBar is obscuring my UIScrollView.
     viewFrame.size.height -= (keyboardSize.height - kTabBarHeight);
     
     [UIView beginAnimations:nil context:NULL];
     [UIView setAnimationBeginsFromCurrentState:YES];
     [self.scrollView setFrame:viewFrame];
     [UIView commitAnimations];
     keyboardIsShown = YES;
     */
    
    //animate the textField
    [self animateTextField: self.messageView distance:keyboardSize.height up: YES];
}


- (void)keyboardWasShown:(NSNotification*)aNotification
{
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    
    //animate the textField
    [self animateTextField: self.messageView distance: 200 up: YES];
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    
    [self animateTextField: self.messageView distance: 0 up: NO];
}


#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    if ( cell == nil )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    
    cell.textLabel.text = self.tableData[ indexPath.item];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void) textFieldDidBeginEditing:(UITextField*)textField
{
    //activeField = textField;
    [self animateTextField: self.messageView distance:258 up: YES];
}

- (void) textFieldDidEndEditing:(UITextField*)textField
{
    //activeField = nil;
    [self animateTextField: self.messageView distance:0 up: NO];
}

- (void) animateTextField: (UIView*) textFieldView distance:(int) distance up: (BOOL) up
{
    const int movementDistance = 258; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}



@end

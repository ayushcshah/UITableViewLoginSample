//
//  ViewController.m
//  TableViewLogin
//
//  Created by Ayush Shah on 09/04/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "LoginCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize loginTableView;


#pragma mark - UITableview Delegate and Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    LoginCell *cell = (LoginCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LoginCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if (indexPath.row == 0) {
        cell.txtBox.placeholder = @"example@gmail.com";
        cell.lbllabel.text = @"Email:";
        [cell.txtBox setKeyboardType:UIKeyboardTypeEmailAddress];
    }
    else {
        cell.txtBox.placeholder = @"Required";
        cell.lbllabel.text = @"Password:";
        [cell.txtBox setSecureTextEntry:YES];
    }
    cell.Tag = indexPath.row;
    
    return cell;
}


#pragma mark - UIView

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [loginTableView setScrollEnabled:NO];
    [loginTableView setSeparatorColor:[UIColor blackColor]];
}

- (void)viewDidUnload {
    [self setLoginTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - UI Events


- (IBAction)btnTouchUp:(id)sender {
    //get Email from Cell UITextField.
    NSIndexPath *indexEmail = [NSIndexPath indexPathForRow:0 inSection:0];
    LoginCell *cellEmail = (LoginCell *)[loginTableView cellForRowAtIndexPath:indexEmail];
    NSString *strEmail = [cellEmail.txtBox.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //get Password from Cell UITextField.
    NSIndexPath *indexPassword = [NSIndexPath indexPathForRow:1 inSection:0];
    LoginCell *cellPassword = (LoginCell *)[loginTableView cellForRowAtIndexPath:indexPassword];
    NSString *strPassword = [cellPassword.txtBox.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([strEmail isEqualToString:@""] || [strEmail isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!!!!"
                                                        message:@"Please Enter Email and Passeord"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome!!!!"
                                                        message:[NSString stringWithFormat:@"hello %@!!!!!",strEmail]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
        NSLog(@"Name: %@ and password: %@ ",strEmail,strPassword);
    }
    
}

@end

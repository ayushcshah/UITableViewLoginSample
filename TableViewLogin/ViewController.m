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
    
    if (cell == nil) 
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LoginCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    }

//    [cell.lbllabel setText:@"User"];
//    [cell.textLabel setText:@"User"];
//    cell.textLabel.text = @"sd";
    if (indexPath.row == 0) {
        cell.txtBox.placeholder=@"example@gmail.com";
        cell.lbllabel.text = @"Email";
    }
    else {
        cell.txtBox.placeholder=@"Required";
        cell.lbllabel.text = @"Password";
    }
    cell.Tag=indexPath.row;
    

    
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tab");
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [loginTableView setScrollEnabled:NO];
    [loginTableView setSeparatorColor:[UIColor blackColor]];
}

- (void)viewDidUnload
{
    [self setLoginTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

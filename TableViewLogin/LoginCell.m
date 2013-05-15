//
//  LoginCell.m
//  TableViewLogin
//
//  Created by Ayush Shah on 09/04/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "LoginCell.h"

@implementation LoginCell
@synthesize txtBox;
@synthesize lbllabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    \
    // Configure the view for the selected state
}

@end

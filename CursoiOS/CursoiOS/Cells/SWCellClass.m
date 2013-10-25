//
//  SWCellClass.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 25/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWCellClass.h"

@implementation SWCellClass

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

    // Configure the view for the selected state
}

@end

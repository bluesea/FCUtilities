//
//  FCSwipeTableViewCell.m
//  SwipeCellDemo
//
//  Created by Ping on 14-6-30.
//  Copyright (c) 2014年 Ping@Flycent. All rights reserved.
//

#import "FCSwipeTableViewCell.h"

@implementation FCSwipeTableViewCell

- (void)awakeFromNib
{
    // Initialization code
    self.textLabel.textColor = [UIColor blackColor];
    self.backgroundView = [[UIView alloc] init];
    self.backgroundView.backgroundColor = [UIColor clearColor];
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
    
    editView = [[UIView alloc]initWithFrame:CGRectMake(320, 0, 150, 50)];
    editView.backgroundColor = [UIColor colorWithRed:251.0/255 green:251.0/255 blue:251.0/255 alpha:255.0/255.0];
    [self addSubview:editView];
    
    UIImageView *lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 4, 1, 40)];
    lineImage.image = [UIImage imageNamed:@"content_title_line.png"];
    [editView addSubview:lineImage];
    
    UIButton *renameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [renameBtn setFrame:CGRectMake(10, 0, 48, 48)];
    [renameBtn setBackgroundImage:[UIImage imageNamed:@"rename"] forState:UIControlStateNormal];
    [renameBtn addTarget:self action:@selector(renamePressed) forControlEvents:UIControlEventTouchUpInside];
    [editView addSubview:renameBtn];
    
    UIImageView *midlineImage = [[UIImageView alloc]initWithFrame:CGRectMake(65, 4, 1, 40)];
    midlineImage.image = [UIImage imageNamed:@"content_title_line.png"];
    [editView addSubview:midlineImage];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setFrame:CGRectMake(75, 0, 48, 48)];
    [deleteBtn setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deletePressed) forControlEvents:UIControlEventTouchUpInside];
    [editView addSubview:deleteBtn];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)swipeLeft
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5];
    
    [editView setFrame:CGRectMake(320-150, 0, 150, 50)];
    if ([self.custCellDelegate respondsToSelector:@selector(setSwipeStatus:editView:swipeCell:)]) {
        [self.custCellDelegate setSwipeStatus:YES editView:editView swipeCell:self];
    }
    
    self.m_swiped = YES;
    [UIView commitAnimations];
}

- (void)swipeRight
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5];
    [editView setFrame:CGRectMake(320, 0, 150, 50)];
    if ([self.custCellDelegate respondsToSelector:@selector(setSwipeStatus:editView:swipeCell:)]) {
        [self.custCellDelegate setSwipeStatus:NO editView:editView swipeCell:nil];
    }
    self.m_swiped = NO;
    [UIView commitAnimations];
}


- (void)renamePressed
{
    [self swipeRight];
    if ([self.custCellDelegate respondsToSelector:@selector(rename)]) {
        [self.custCellDelegate rename];
    }
}

- (void)deletePressed
{
    [self swipeRight];
    if ([self.custCellDelegate respondsToSelector:@selector(deleteFile)]) {
        [self.custCellDelegate deleteFile];
    }
}

@end

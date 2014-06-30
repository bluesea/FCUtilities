//
//  FCSwipeTableViewCell.h
//  SwipeCellDemo
//
//  Created by Ping on 14-6-30.
//  Copyright (c) 2014年 Ping@Flycent. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FCSwipeTableViewCellDelegate <NSObject>

@optional
-(void)fileOrFolderCustCellSelected:(BOOL)flag;

-(void)setSwipeStatus:(BOOL)swiped editView:(UIView *)view swipeCell:(UITableViewCell *)cell;
- (void)rename;
- (void)deleteFile;
@end


@interface FCSwipeTableViewCell : UITableViewCell
{
    UIView *editView;
}
@property (nonatomic,assign)id<FCSwipeTableViewCellDelegate>custCellDelegate;
@property (nonatomic)BOOL m_swiped;

- (void)recover:(UIView*)view;
- (void)swipeLeft;

- (void)swipeRight;
@end

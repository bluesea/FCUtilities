//
//  FCViewController.m
//  SwipeCellDemo
//
//  Created by Ping on 14-6-30.
//  Copyright (c) 2014年 Ping@Flycent. All rights reserved.
//

#import "FCViewController.h"
#import "FCSwipeTableViewCell.h"

@interface FCViewController ()<UITableViewDataSource,UITableViewDelegate,FCSwipeTableViewCellDelegate>
{
    UITableView *listTable;
    BOOL    isswiped;
    FCSwipeTableViewCell *swipeCell;
    UITapGestureRecognizer *tapGesture;
    NSIndexPath *swipeIndexPath;
    UIView  *cellEditView;
}

@end

@implementation FCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets =NO;
    listTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, 460) style:UITableViewStylePlain];
    listTable.delegate = self;
    listTable.dataSource = self;
    [self.view addSubview:listTable];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITabelViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *inden = @"contentCellIdent";
    FCSwipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inden];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FCSwipeTableViewCell" owner:self options:nil] objectAtIndex:0];
        cell.textLabel.font = [cell.textLabel.font fontWithSize:17];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.custCellDelegate = self;
        UISwipeGestureRecognizer *showExtrasSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellSwipe:)];
        showExtrasSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
        [cell  addGestureRecognizer:showExtrasSwipe];
        
        UISwipeGestureRecognizer *hideExtrasSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellSwipeHide:)];
        hideExtrasSwipe.direction = UISwipeGestureRecognizerDirectionRight;
        [cell  addGestureRecognizer:hideExtrasSwipe];
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
    
}


#pragma mark -Gesture
- (void)tapView
{
    if (isswiped) {
        [swipeCell swipeRight];
    }
}

-(void)cellSwipe:(UISwipeGestureRecognizer *)gesture
{
    if (isswiped) {
        [swipeCell swipeRight];
        return;
    }
    CGPoint location = [gesture locationInView:listTable];
    NSIndexPath *swipedIndexPath = [listTable indexPathForRowAtPoint:location];
    swipeIndexPath = [swipedIndexPath copy];
    swipeCell  = (FCSwipeTableViewCell *)[listTable cellForRowAtIndexPath:swipedIndexPath];
    [swipeCell swipeLeft];
    isswiped = YES;
}

- (void)cellSwipeHide:(UISwipeGestureRecognizer *)gesture
{
    [swipeCell swipeRight];
    isswiped = NO;
}

#pragma mark - CustomerCloudCellDelegate methods
-(void)fileOrFolderCustCellSelected:(BOOL)flag
{
    
}

-(void)setSwipeStatus:(BOOL)swiped editView:(UIView *)view swipeCell:(UITableViewCell *)cell
{
    //    swipeCell = (CustomerCloudCell *)cell;
    isswiped = swiped;
    cellEditView = view;
    if (isswiped) {
        if (!tapGesture) {
            tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView)];
        }
        [self.view addGestureRecognizer:tapGesture];
    }else{
        [self.view removeGestureRecognizer:tapGesture];
    }
}


- (void)rename
{
    NSLog(@"1111111111111");
}

- (void)deleteFile
{
    NSLog(@"222222222222");
}

@end

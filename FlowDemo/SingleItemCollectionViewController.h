//
//  SingleItemCollectionViewController.h
//  FlowDemo
//
//  Created by Guy Israeli on 1/26/15.
//  Copyright (c) 2015 Guy Israeli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleItemCollectionViewController : UICollectionViewController 

@property (nonatomic, strong)     NSIndexPath *initialIndexPath;
@property (nonatomic, strong) NSMutableArray *items;


@end

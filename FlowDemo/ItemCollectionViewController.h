//
//  ItemCollectionViewController.h
//  FlowDemo
//
//  Created by Guy Israeli on 1/26/15.
//  Copyright (c) 2015 Guy Israeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CHTCollectionViewWaterfallLayout.h>
@interface ItemCollectionViewController : UICollectionViewController <UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@end

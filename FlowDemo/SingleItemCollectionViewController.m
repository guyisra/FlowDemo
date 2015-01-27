//
//  SingleItemCollectionViewController.m
//  FlowDemo
//
//  Created by Guy Israeli on 1/26/15.
//  Copyright (c) 2015 Guy Israeli. All rights reserved.
//

#import "SingleItemCollectionViewController.h"
#import "FlowItem.h"
#import "FlowCell.h"

@interface SingleItemCollectionViewController ()

@end

@implementation SingleItemCollectionViewController{

}

static NSString * const reuseIdentifier = @"FullPageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if ([_items count] == 0){
        _items = [NSMutableArray arrayWithCapacity:1000];
        
        
        for (NSInteger i =0; i < 1000; i++){
            FlowItem *item = [FlowItem new];
            item.size = CGSizeMake(arc4random() % 50 + 50, arc4random() % 50 + 50);
            [_items addObject:item];
        }
    }
    
    
    
//    _initialIndexPath = [NSIndexPath indexPathForRow:50 inSection:0];
                        //    UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
//    flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    flow.minimumInteritemSpacing =0;
//    flow.minimumLineSpacing =0;
//    [flow setItemSize:CGSizeMake([[UIScreen mainScreen] applicationFrame].size.width,
//                                [[UIScreen mainScreen] applicationFrame].size.height)];
//    

    
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CellNib" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.navigationController.navigationBarHidden = NO;

    // Do any additional setup after loading the view.
}

    

-(void)setInitialIndexPath:(NSIndexPath *)initialIndexPath{
    _initialIndexPath = initialIndexPath;
}

-(void)viewWillAppear:(BOOL)animated{
    if (_initialIndexPath){
        [self.collectionView scrollToItemAtIndexPath:_initialIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        
    }
}

-(void)viewDidAppear:(BOOL)animated{
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete method implementation -- Return the number of items in the section
    return [_items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];


    cell.backgroundColor = [_items[indexPath.row] color];
    cell.numLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}



-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width,
                      [[UIScreen mainScreen] bounds].size.height);
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end

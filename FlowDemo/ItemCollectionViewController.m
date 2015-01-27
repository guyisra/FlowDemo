//
//  ItemCollectionViewController.m
//  FlowDemo
//
//  Created by Guy Israeli on 1/26/15.
//  Copyright (c) 2015 Guy Israeli. All rights reserved.
//

#import "ItemCollectionViewController.h"
#import "FlowCell.h"
#import "FlowItem.h"
#import "SingleItemCollectionViewController.h"

@interface ItemCollectionViewController ()

@end

@implementation ItemCollectionViewController{
    NSMutableArray *items;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    items = [NSMutableArray arrayWithCapacity:1000];
    
    
    for (NSInteger i =0; i < 1000; i++){
        FlowItem *item = [FlowItem new];
        item.size = CGSizeMake(arc4random() % 50 + 50, arc4random() % 50 + 50);
        [items addObject:item];
    }
    
    CHTCollectionViewWaterfallLayout *layout = [CHTCollectionViewWaterfallLayout new];
    
    layout.sectionInset = UIEdgeInsetsMake(5, 0, 5, 0); //space from edge of screen
    layout.minimumColumnSpacing = 0; //space between column
    layout.minimumInteritemSpacing = 0; //space between rows
    layout.columnCount = 2;
    
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
//    [self.collectionView registerClass:[FlowCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CellNib" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:@"CellFooter"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"CellHeader"];
    
    self.navigationController.navigationBarHidden = YES;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Tap:(UITapGestureRecognizer *)sender {
        CGPoint point = [sender locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
    if (indexPath){
        [self performSegueWithIdentifier:@"CellTap" sender:indexPath];
    }
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"CellTap"]){
            SingleItemCollectionViewController *dest = segue.destinationViewController;
                       dest.initialIndexPath = (NSIndexPath *)sender;
        dest.items = items;
        
    }
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
    return [items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    NSInteger row = indexPath.row;
    FlowCell *cell = (FlowCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSLog(@"%d", row);
    cell.backgroundColor = [items[row] color];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    
    cell.numLabel.text = [NSString stringWithFormat:@"%d", row];
    
    return cell;
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        UICollectionReusableView *demoHeaderCell = (UICollectionReusableView*)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CellHeader" forIndexPath:indexPath];
        return demoHeaderCell;
    }
    else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]) {
        UICollectionReusableView *demoFooterCell = (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CellFooter" forIndexPath:indexPath];
        return demoFooterCell;
    }
    
    return nil;
}

//#pragma mark - CHTCollectionViewDelegateWaterfallLayout


// this method asks for the size of cell at indexpath
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return [items[indexPath.row] size];
//    return CGSizeMake(100, arc4random() % 200);
}

// this method asks for height of footer at indexpath
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section {
    CGFloat height = 120;
    return height;
}

// this method is called when a cell is selected (tapped on)
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Cell at %ld is selected", [indexPath row]);
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

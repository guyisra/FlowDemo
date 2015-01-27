//
//  FlowItem.h
//  FlowDemo
//
//  Created by Guy Israeli on 1/26/15.
//  Copyright (c) 2015 Guy Israeli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>

@interface FlowItem : NSObject


@property (nonatomic, strong) UIColor *color;
@property (nonatomic) CGSize size;


-(void)setColor:(UIColor *)color;
-(UIColor*)color;

-(void)setSize:(CGSize)size;
-(CGSize)size;

@end


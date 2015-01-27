//
//  FlowItem.m
//  FlowDemo
//
//  Created by Guy Israeli on 1/26/15.
//  Copyright (c) 2015 Guy Israeli. All rights reserved.
//

#import "FlowItem.h"


@implementation FlowItem

@synthesize color = _color;
@synthesize size = _size;


-(instancetype)init{
    if (!(self = [super init])) return nil;
    _color = [self randomColor];
    return self;
}

-(void)setColor:(UIColor *)newcolor{
    _color = newcolor;
}
-(UIColor*)color{
    return _color;
}

-(void)setSize:(CGSize)size{
    _size = size;
}
-(CGSize)size{
    return _size;
}


-(CGFloat)randomColorValue{
    return (arc4random() % 255)/255.0f;
}

-(UIColor *)randomColor{
    return [UIColor colorWithRed:[self randomColorValue]
                    green:[self randomColorValue]
                     blue:[self randomColorValue]
                    alpha:1.0];
}

@end

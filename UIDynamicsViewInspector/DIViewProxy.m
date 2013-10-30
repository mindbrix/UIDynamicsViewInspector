//
//  DIViewProxy.m
//  Dynamics Inspector Demo
//
//  Created by Nigel Barber on 30/10/2013.
//  Copyright (c) 2013 Nigel Barber. All rights reserved.
//

#import "DIViewProxy.h"


@interface DIViewProxy ()

@property( nonatomic, strong ) UIView *view;

@end



@implementation DIViewProxy

-(instancetype)initWithView:(UIView *)view
{
    self = [ super init ];
    
    if( self )
    {
        self.view = view;
    }
    
    return self;
}



#pragma mark - UIDynamicItem

-(CGPoint)center
{
    return self.view.center;
}

-(void)setCenter:(CGPoint)center
{
    self.view.center = center;
}

-(CGRect)bounds
{
    return self.view.bounds;
}


-(CGAffineTransform)transform
{
    return self.view.transform;
}

-(void)setTransform:(CGAffineTransform)transform
{
    self.view.transform = transform;
}

@end

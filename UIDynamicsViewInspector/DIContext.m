//
//  DIContext.m
//  Dynamics Inspector Demo
//
//  Created by Nigel Barber on 30/10/2013.
//  Copyright (c) 2013 Nigel Barber. All rights reserved.
//

#import "DIContext.h"

@interface DIContext ()

@property( nonatomic, strong ) UIDynamicAnimator *animator;
@property( nonatomic, strong ) UIView *view;

@end



@implementation DIContext


-(instancetype)initWithView:(UIView *)view
{
    self = [ super init ];
    
    if( self )
    {
        self.view = view;
        
        self.animator = [[ UIDynamicAnimator alloc ] initWithReferenceView:view ];
        
        UIGravityBehavior *gravity = [[ UIGravityBehavior alloc ] initWithItems:self.view.subviews ];
        UICollisionBehavior *collision = [[ UICollisionBehavior alloc ] initWithItems:self.view.subviews ];
        collision.translatesReferenceBoundsIntoBoundary = YES;
        collision.collisionMode = UICollisionBehaviorModeEverything;
        
        [ self.animator addBehavior:gravity ];
        [ self.animator addBehavior:collision ];
    }
    
    return self;
}




@end

//
//  DIContext.m
//  Dynamics Inspector Demo
//
//  Created by Nigel Barber on 30/10/2013.
//  Copyright (c) 2013 Nigel Barber. All rights reserved.
//

#import "DIContext.h"
#import "DIViewProxy.h"


@interface DIContext ()

@property( nonatomic, strong ) UIDynamicAnimator *animator;
@property( nonatomic, strong ) UIGravityBehavior *gravity;
@property( nonatomic, strong ) NSArray *proxies;
@property( nonatomic, strong ) UIView *view;

@end



@implementation DIContext


-(instancetype)initWithView:(UIView *)view
{
    self = [ super init ];
    
    if( self )
    {
        self.view = view;
        
        self.proxies = [ self proxiesForViews:self.view.subviews ];
        //self.proxies = [ self recursiveProxiesForViews:self.view.subviews ];
        
        if( self.proxies )
        {
            self.animator = [[ UIDynamicAnimator alloc ] init ];
        }
        else
        {
            self.animator = [[ UIDynamicAnimator alloc ] initWithReferenceView:view ];
        }
        
        NSArray *views = ( self.proxies ) ? self.proxies : self.view.subviews;
        
        self.gravity = [[ UIGravityBehavior alloc ] initWithItems:views ];
        UICollisionBehavior *collision = [[ UICollisionBehavior alloc ] initWithItems:views ];
        
        if( self.proxies )
        {
            [ collision addBoundaryWithIdentifier:@"bounds" forPath:[ UIBezierPath bezierPathWithRect:self.view.bounds ]];
        }
        else
        {
            collision.translatesReferenceBoundsIntoBoundary = YES;
        }
        
        collision.collisionMode = UICollisionBehaviorModeEverything;
        
        UIDynamicItemBehavior *bounce = [[ UIDynamicItemBehavior alloc ] initWithItems:views ];
        bounce.elasticity = 1.0f;
        
        [ self.animator addBehavior:self.gravity ];
        [ self.animator addBehavior:collision ];
        [ self.animator addBehavior:bounce ];
        
        [[ NSNotificationCenter defaultCenter ] addObserver:self selector:@selector(didRotate:)name:UIDeviceOrientationDidChangeNotification object:nil ];
    }
    
    return self;
}




-(void)didRotate:(NSNotification *)notification
{
    //self.gravity.angle = UIInterfaceOrientationAngleOfOrientation([ UIApplication sharedApplication ].statusBarOrientation );
}


CGFloat UIInterfaceOrientationAngleOfOrientation(UIInterfaceOrientation orientation)
{
    CGFloat angle;
    
    switch (orientation)
    {
        case UIInterfaceOrientationPortraitUpsideDown:
            angle = 0;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            angle = -M_PI;
            break;
        case UIInterfaceOrientationLandscapeRight:
            angle = 0;
            break;
        default:
            angle = M_PI_2;
            break;
    }
    
    return angle;
}


-(NSArray *)proxiesForViews:(NSArray *)views
{
    NSMutableArray *proxies = [ NSMutableArray array ];
    
    for( UIView *view in views )
    {
        if(( view.bounds.size.width != 0.0f ) && ( view.bounds.size.height != 0.0f ))
        {
            DIViewProxy *proxy = [[ DIViewProxy alloc ] initWithView:view ];
            
            [ proxies addObject:proxy ];
        }
        
    }
    
    return [ NSArray arrayWithArray:proxies ];
}


-(NSArray *)recursiveProxiesForViews:(NSArray *)views
{
    NSMutableArray *proxies = [ NSMutableArray array ];
    
    [ self recursivelyInitProxiesForViews:views intoArray:proxies ];
    
    return [ NSArray arrayWithArray:proxies ];
}

-(void)recursivelyInitProxiesForViews:(NSArray *)views intoArray:(NSMutableArray *)array
{
    for( UIView *view in views )
    {
        if(( view.bounds.size.width != 0.0f ) && ( view.bounds.size.height != 0.0f ))
        {
            DIViewProxy *proxy = [[ DIViewProxy alloc ] initWithView:view ];
            
            [ array addObject:proxy ];
        }
        
        
        [ self recursivelyInitProxiesForViews:view.subviews intoArray:array ];
    }
}
@end

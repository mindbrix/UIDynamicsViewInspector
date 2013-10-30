//
//  DIContext.m
//  Dynamics Inspector Demo
//
//  Created by Nigel Barber on 30/10/2013.
//  Copyright (c) 2013 Nigel Barber. All rights reserved.
//

#import "DIContext.h"

@interface DIContext ()

@property( nonatomic, strong ) UIView *view;

@end



@implementation DIContext


-(instancetype)initWithView:(UIView *)view
{
    self = [ super init ];
    
    if( self )
    {
        self.view = view;
    }
    
    return self;
}




@end

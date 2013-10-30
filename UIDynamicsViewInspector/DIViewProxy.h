//
//  DIViewProxy.h
//  Dynamics Inspector Demo
//
//  Created by Nigel Barber on 30/10/2013.
//  Copyright (c) 2013 Nigel Barber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DIViewProxy : NSObject<UIDynamicItem>

-(instancetype)initWithView:(UIView *)view;

@end

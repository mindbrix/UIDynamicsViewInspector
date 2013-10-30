//
//  DIViewController.m
//  Dynamics Inspector Demo
//
//  Created by Nigel Barber on 30/10/2013.
//  Copyright (c) 2013 Nigel Barber. All rights reserved.
//

#import "DIViewController.h"

#import "DIContext.h"

@interface DIViewController ()

@property( nonatomic, strong ) DIContext *diContext;

@end

@implementation DIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)viewDidAppear:(BOOL)animated
{
    [ super viewDidAppear:animated ];
    
    
    if( ! self.diContext )
    {
        self.diContext = [[ DIContext alloc ] initWithView:self.view ];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

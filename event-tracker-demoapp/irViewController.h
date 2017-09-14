//
//  irViewController.h
//  DemoApplication
//
//  Created by Tyler Thomas on 1/10/13.
//  Copyright (c) 2017 Impact Radius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventTracker.h"
#import "Event.h"

@interface irViewController : UIViewController

@property (nonatomic, strong) EventTracker *tracker;
@property (nonatomic, strong) Event *itemEvent;

@property (nonatomic, strong) NSMutableArray *itemArray;

@property (nonatomic, strong) IBOutlet UITextField *customInput;


@end

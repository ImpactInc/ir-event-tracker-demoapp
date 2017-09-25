//
//  irViewController.m
//  DemoApplication
//
//  Created by Tyler Thomas
//  Copyright (c) 2017 Impact Radius. All rights reserved.
//

#import "irViewController.h"
#import <EventTracker.h>
#import <Event.h>
#import <Item.h>


@interface irViewController ()

-(IBAction)trackSession:(id)sender;
-(IBAction)trackEventWithSingleItem:(id)sender;
-(IBAction)trackEventWithMultipleItems:(id)sender;


@end

@implementation irViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  _tracker = [EventTracker sharedManager];
}

-(IBAction) trackSession:(id)sender {
  [_tracker trackSession];
}

-(IBAction) trackMoneyEvent:(id)sender {
  [_tracker changeAppId:@"7146" accountSID:@"IRCB6WWtJcDz10569cEfKYe3f7eGAdHst1" authorizationToken:@"kA4YuzHcUJq8jnTHiPQUghSs6Qgvbdp9"];

  [_tracker trackEvent:@"Money event" amount:@"15.99"];
}


-(IBAction) trackEventWithSingleItem:(id)sender {
  [_tracker changeAppId:@"7146" accountSID:@"IRCB6WWtJcDz10569cEfKYe3f7eGAdHst1" authorizationToken:@"kA4YuzHcUJq8jnTHiPQUghSs6Qgvbdp9"];
  Event* event = [_tracker newEvent:@"Event Name"];
  [event setMoney1:@"testing money1"];
  Item *item = [[Item alloc] init];
  [item setName:@"Item Name"];
  [item setCategory:@"Category"];
  [item setAmount:@"1"];
  [item setQuantity:@"1"];
  [item setRebate:@"1"];
  [item setSku:@"1"];
  [item addCustomParam:@"custom1" value:@"custom value 1"];
  [item addCustomParam:@"custom2" value:@"custom value 2"];
  [item setPromoCodeDescription:@"testing promo description"];
  [item setPromoCode:@"testing promo code"];
  [item setPrice:@"testing price"];
  [item setMPN:@"testing mpn"];
  [item setSubCategory:@"testing sub category"];
  [item setDeliveryType:@"testing delivery type"];
  [item setDiscount:@"discount"];
  [item setTotalDiscount:@"testing total discount"];
  
  NSMutableArray* itemArray = [[NSMutableArray alloc] initWithObjects:item, nil];
  
  [_tracker submit:event withItemArray:itemArray];
}


-(IBAction) trackEventWithMultipleItems:(id)sender {
  
  
  
  
  [_tracker changeAppId:@"7146" accountSID:@"IRCB6WWtJcDz10569cEfKYe3f7eGAdHst1" authorizationToken:@"kA4YuzHcUJq8jnTHiPQUghSs6Qgvbdp9"];
  Event* event = [_tracker newEvent:@"Mutiple Item Event"];
  
  Item *item1 = [[Item alloc] init];
  [item1 setName:@"Item1"];
  [item1 setCategory:@"Category1"];
  [item1 setAmount:@"120"];
  [item1 setQuantity:@"1"];
  [item1 setRebate:@"12"];
  [item1 setSku:@"1"];
  [item1 addCustomParam:@"custom1" value:@"custom_value_1"];
  [item1 addCustomParam:@"custom2" value:@"custom_value_2"];
  
  Item *item2 = [[Item alloc] init];
  [item2 setName:@"Item2"];
  [item2 setCategory:@"Category2"];
  [item2 setAmount:@"80"];
  [item2 setQuantity:@"2"];
  
  NSMutableArray* itemArray = [[NSMutableArray alloc] initWithObjects:item1, @"string", item2, [NSNull null], nil];
  
  [_tracker submit:event withItemArray:itemArray];
}





- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end

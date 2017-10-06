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
@property (nonatomic, weak) IBOutlet UITextView *msg;
@property NSString *info;
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
  _itemArray = [[NSMutableArray alloc] init];
  [_msg setEditable:NO];
  [_msg setText:@""];
  [_msg setScrollEnabled:YES];
  [_msg setTextColor:[UIColor redColor]];
  _info = @"Submitted an event \"%@\" with %d item. \n(For the details of posted data, please check the debug console)";
}

-(IBAction) trackSession:(id)sender {
  [_tracker trackSession];
  [_msg setText:@"Submitted an event with session data. \n(For the details of posted data, please check the debug console)"];
}

-(IBAction) trackMoneyEvent:(id)sender {
  [_tracker trackEvent:@"Money event" subTotal:@"15.99"];
  [_msg setText:@"Submitted an event with purchase info: \nsubtotal: 15.99. \n(For the details of posted data, please check the debug console)"];
}


-(IBAction) trackEventWithSingleItem:(id)sender {
  NSString *name = @"Single Item Event";
  Event* event = [_tracker newEvent:name];
  [self populateAllFields:event];
  Item *item = [[Item alloc] init];
  [item setName:@"Item Name"];
  [item setCategory:@"Category"];
  [item setSubTotal:@"1"];
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
  
  [_msg setText:[NSString stringWithFormat:_info, name, 1]];
}


-(IBAction) trackEventWithMultipleItems:(id)sender {
  NSString *name = @"Mutiple Item Event";
  Event* event = [_tracker newEvent:name];
  Item *item1 = [[Item alloc] init];
  [item1 setName:@"Item1"];
  [item1 setCategory:@"Category1"];
  [item1 setSubTotal:@"120"];
  [item1 setQuantity:@"1"];
  [item1 setRebate:@"12"];
  [item1 setSku:@"1"];
  [item1 addCustomParam:@"custom1" value:@"custom_value_1"];
  [item1 addCustomParam:@"custom2" value:@"custom_value_2"];
  
  Item *item2 = [[Item alloc] init];
  [item2 setName:@"Item2"];
  [item2 setCategory:@"Category2"];
  [item2 setSubTotal:@"80"];
  [item2 setQuantity:@"2"];
  
  NSMutableArray* itemArray = [[NSMutableArray alloc] initWithObjects:item1, @"string", item2, [NSNull null], [self genItemWithRamdomFields], nil];
  
  [_tracker submit:event withItemArray:itemArray];
  [_msg setText:[NSString stringWithFormat:_info, name, 2]];
}

- (IBAction) trackEventWithItems:(id)sender {
  NSString *name = @"Customized Item Event";
  Event *event = [_tracker newEvent:name];
  [self populateAllFields:event];
  
  [_tracker submit:event withItemArray:_itemArray];
  
  [_msg setText:[NSString stringWithFormat:_info, name, _itemArray.count]];
}

- (IBAction) addItem:(id)sender {
  [_itemArray addObject:[self genItemWithRamdomFields]];
  [_msg setText:[NSString stringWithFormat:@"Added one item, total items: %d", _itemArray.count]];
}

- (IBAction) deleteAllItems:(id)sender {
  [_itemArray removeAllObjects];
  [_msg setText:@"All items have been deleted"];
}

- (void) populateAllFields:(Event *) event {
  [event setCurrency:@"USD"];
  [event setClickId:@"ATESTCLICKID001"];
  [event setCustomerId:@"CustomerId_1"];
  [event setCustomerStatus:@"CustomerStatus_1"];
  [event setCustomerCity:@"Santa Barbara"];
  [event setCustomerCountry:@"US"];
  [event setCustomerRegion:@"California"];
  [event setCustomerEmail:@"customer@test.com"];
  [event setDisposition:@"Disposition_1"];
  [event setExchangeRate:@"1.2"];
  [event setNote:@"Note_1"];
  [event setPostalCode:@"93101"];
  [event setPromoCode:@"1234"];
  [event setStatus:@"Status_1"];
  [event setUserAgent:@"Mozilla 6.0"];
  [event setRebate:@"10"];
  [event setText1:@"Text1_1"];
  [event setText2:@"Text2_1"];
  [event setText3:@"Text3_1"];
  [event setDate1:@"2017-09-01 00:00:00"];
  [event setDate2:@"2017-09-02 00:00:00"];
  [event setDate3:@"2017-09-03 00:00:00"];
  [event setMoney1:@"Money1_1"];
  [event setMoney2:@"Money2_1"];
  [event setMoney3:@"Money3_1"];
  [event setHearAboutUs:@"Google Search"];
  [event setLocationId:@"LocationId_1"];
  [event setLocationName:@"LocationName_1"];
  [event setLocationType:@"LocationType_1"];
  [event setDisplayDense:@"1.5"];
  [event setPayable:YES];
  [event setPaymentType:@"Credit"];
  [event setIpAddressCarrier:@"10.15.2.37"];
  [event setIpAddressWifi:@"192.168.3.235"];
  [event setOrderId:@"OrderId_1"];
  [event setOrderSubTotalPreDiscount:@"105.7"];
  [event setOrderSubTotalPostDiscount:@"102"];
  [event setOrderDiscount:@"OrderDiscount_1"];
  [event setOrderPromoCodeDescription:@"PromoCodeDesc_1"];
  [event setOrderShipping:@"USPS"];
  [event setOrderTax:@"7.8"];
  [event setGiftPurchase:@"YES"];
  [event setNumeric1:@"1.5"];
  [event setNumeric2:@"2.8"];
  [event setNumeric3:@"3.5"];
  [event setCallerId:@"8056669999"];
  [event setPhoneNumber:@"8058885555"];
}

- (Item *) genItemWithRamdomFields {
  Item *item = [[Item alloc] init];
  unsigned int ran_label = arc4random_uniform(1000) + 1;
  [item setName:[NSString stringWithFormat:@"Test-Item-%d", ran_label]];
  [item setSku:[NSString stringWithFormat:@"Sku-%d", ran_label]];
  [item setQuantity:@"1"];
  [item setSubTotal:[NSString stringWithFormat:@"%d", ran_label]];
  [item setMPN:[NSString stringWithFormat:@"MPN-%d", ran_label]];
  [item setPrice:[NSString stringWithFormat:@"%d", ran_label]];
  [item setCategory:[NSString stringWithFormat:@"CAT-%d", ran_label]];
  [item setSubCategory:[NSString stringWithFormat:@"SUBCAT-%d", ran_label]];
  [item setDiscount:[NSString stringWithFormat:@"%d", ran_label / 3]];
  [item setTotalDiscount:[NSString stringWithFormat:@"%d", ran_label / 3]];
  [item setDeliveryType:@"Ground Express"];
  [item setPromoCode:[NSString stringWithFormat:@"PROMO-%d", ran_label]];
  [item setPromoCodeDescription:[NSString stringWithFormat:@"PROMO_DESC-%d", ran_label]];
  [item addCustomParam:@"cust1" value:[NSString stringWithFormat:@"val1-%d", ran_label]];
  [item addCustomParam:@"cust2" value:[NSString stringWithFormat:@"val2-%d", ran_label]];
  
  return item;
}




- (void) didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end

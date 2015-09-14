//
//  TipViewController.m
//  TipCalculator
//
//  Created by Devin Bhushan on 9/13/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property(weak, nonatomic) IBOutlet UITextField *billTextField;
@property(weak, nonatomic) IBOutlet UILabel *billLabel;
@property(weak, nonatomic) IBOutlet UILabel *tipLabel;
@property(weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;
- (void)updateDefaultValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.title = @"Tip Calculator";
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self updateDefaultValues];
  [self updateValues];

  self.navigationItem.rightBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"Settings"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(onSettingsButton)];
}

- (void)viewWillAppear:(BOOL)animated {
  [self updateDefaultValues];
  [self updateValues];
}

- (void)updateDefaultValues {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  int defaultTipIndex = (int)[defaults integerForKey:@"defaultTipValue"];
  [self.tipControl setSelectedSegmentIndex:defaultTipIndex];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
  [self.view endEditing:YES];
  [self updateValues];
}

- (void)updateValues {
  float billAmount = [self.billTextField.text floatValue];

  NSArray *tipValues = @[ @(0.1), @(0.15), @(0.2) ];
  float tipPercentage =
      [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
  float tipAmount = tipPercentage * billAmount;
  float totalAmount = tipAmount + billAmount;

  self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
  self.billLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)onSettingsButton {
  [self.navigationController
      pushViewController:[[SettingsViewController alloc] init]
                animated:YES];
}

@end

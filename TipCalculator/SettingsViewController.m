//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Devin Bhushan on 9/13/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property(weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

- (void)updateDefaultTipValue;
- (IBAction)onDefaultTipValueUpdate:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self updateDefaultTipValue];
  // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)onDefaultTipValueUpdate:(id)sender {
  long defaultTipIndex = self.defaultTipControl.selectedSegmentIndex;

  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setInteger:(int)defaultTipIndex forKey:@"defaultTipValue"];
  [defaults synchronize];
}

- (void)updateDefaultTipValue {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  int defaultTipIndex = (int)[defaults integerForKey:@"defaultTipValue"];
  [self.defaultTipControl setSelectedSegmentIndex:defaultTipIndex];
}

@end

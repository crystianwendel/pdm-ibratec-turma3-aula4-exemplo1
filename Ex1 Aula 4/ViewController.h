//
//  ViewController.h
//  Ex1 Aula 4
//
//  Created by Crystian Leao on 05/08/17.
//  Copyright © 2017 Crystian Leao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


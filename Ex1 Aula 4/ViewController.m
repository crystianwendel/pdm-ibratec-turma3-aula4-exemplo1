//
//  ViewController.m
//  Ex1 Aula 4
//
//  Created by Crystian Leao on 05/08/17.
//  Copyright © 2017 Crystian Leao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong) NSDictionary *bairros;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.bairros = [NSMutableDictionary dictionaryWithDictionary:@{
        @"Zona norte":[NSMutableArray arrayWithArray: @[@"Macaxeira", @"Aflitos", @"Casa Amarela", @"Alto do Mandu"]],
        @"Zona sul":[NSMutableArray arrayWithArray: @[@"Pina", @"Brasília Teimosa", @"Boa Viagem"]],
        @"Olinda Alta":[NSMutableArray arrayWithArray: @[@"Sé", @"Amparo"]]
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.bairros.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *regiao = self.bairros.allKeys[section];
    return [self.bairros[regiao] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    NSString *regiao = self.bairros.allKeys[indexPath.section];
    NSString *bairro = self.bairros[regiao][indexPath.row];
    
    if ([bairro isEqualToString:@"Aflitos"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    }
    
    cell.textLabel.text = bairro;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *regiao = self.bairros.allKeys[section];
    return regiao;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *regiao = self.bairros.allKeys[indexPath.section];
    NSString *bairro = self.bairros[regiao][indexPath.row];
    
    NSString *message = [NSString stringWithFormat:@"%@ - %@", regiao, bairro];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Opa"
                                                                   message: message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *b1 = [UIAlertAction actionWithTitle:@"Deletar"
                                                 style:UIAlertActionStyleDestructive
                                               handler:^(UIAlertAction * _Nonnull action) {
        [self.bairros[regiao] removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }];
    [alert addAction:b1];
    
    UIAlertAction *b2 = [UIAlertAction actionWithTitle:@"Detalhar"
                                                 style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * _Nonnull action) {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"detalheBairros"];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    [alert addAction:b2];
    
    UIAlertAction *b3 = [UIAlertAction actionWithTitle:@"Cancelar"
                                                 style:UIAlertActionStyleCancel
                                               handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancelou");
    }];
    [alert addAction:b3];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end

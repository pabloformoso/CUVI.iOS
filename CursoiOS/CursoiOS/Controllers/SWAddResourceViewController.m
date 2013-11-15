//
//  SWAddResourceViewController.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWResource.h"
#import "SWAddResourceViewController.h"
#import "SWPostResourceService.h"
@interface SWAddResourceViewController ()

@end

@implementation SWAddResourceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [super viewWillAppear:animated];
  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"MiNotificacion" object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardUp)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardDown)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
  
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)keyboardUp {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [UIView animateWithDuration:1 animations:^{
    [_scrollView setFrame:CGRectMake(0, 0, 320, 260)];
  }];
}

- (void)keyboardDown {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [UIView animateWithDuration:1 animations:^{
    [_scrollView setFrame:CGRectMake(0, 0, 320, 455)];
  }];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  
  if ([textField isEqual:_nameTextField]) { // NEXT
    [_urlTextField becomeFirstResponder];
    [_scrollView scrollRectToVisible:_urlTextField.frame animated:YES];
    
  } else if ([textField isEqual:_urlTextField]) { // NEXT
    [_descTextField becomeFirstResponder];
    [_scrollView scrollRectToVisible:_descTextField.frame animated:YES];
    
  } else if ([textField isEqual:_descTextField]) { // SEND
    // Enviar el contendio
    [self save:textField];
    [textField resignFirstResponder];
  }
  
  return YES;
}

- (IBAction)save:(id)sender {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  SWResource *res = [[SWResource alloc] init];
  [res setName:_nameTextField.text];
  [res setLink:_urlTextField.text];
  [res setDescription:_descTextField.text];
  
  SWPostResourceService *ws = [[SWPostResourceService alloc] init];
  [ws createResource:res fromController:self];
  
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)updateView:(NSString *)status {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [MBProgressHUD hideHUDForView:self.view animated:YES];
  
  if ([status isEqualToString:@"OK"]) {
    [self.navigationController popToRootViewControllerAnimated:YES];
  } else {
    UIAlertView *alertView =
    [[UIAlertView alloc] initWithTitle:@"Error"
                               message:@"No se ha creado el recurso"
                              delegate:nil
                     cancelButtonTitle:@"Aceptar"
                     otherButtonTitles:nil];
    
    [alertView show];
  }
}

@end

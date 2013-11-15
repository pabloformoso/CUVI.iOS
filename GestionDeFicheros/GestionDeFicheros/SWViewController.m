//
//  SWViewController.m
//  GestionDeFicheros
//
//  Created by Pablo Formoso Estada on 19/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWViewController.h"

@interface SWViewController ()

@end

@implementation SWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction for view controller
- (IBAction)readFile:(id)sender {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"plantilla"
                                                        ofType:@"txt"];
    NSError *error = nil;

    NSString *text = [NSString stringWithContentsOfFile:filePath
                                               encoding:NSUTF8StringEncoding
                                                  error:&error];
    
    if ([error code] != 0) {
        [_txLabel setText:[error localizedDescription]];
    } else {
        [_txLabel setText:text];
        //_txLabel.text = content;
    }
}

- (IBAction)addPhoto:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Opciones"
delegate:self
cancelButtonTitle:@"Cancelar"
destructiveButtonTitle:nil
otherButtonTitles:@"Cámara", @"Librería", nil];
    
    [actionSheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate Methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
#ifndef NDEBUG
    NSLog(@"%s (line:%d) clicked %i", __PRETTY_FUNCTION__, __LINE__, buttonIndex);
#endif
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    
    NSString *requiredType;
    requiredType = (NSString *)kUTTypeImage;
    picker.mediaTypes = @[requiredType];
    picker.allowsEditing = YES;
    
    if (buttonIndex == 0) { // Camara
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    } else if (buttonIndex == 1) { //Librería
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    } else {
        [_txLabel setText:@"No se que se ha presionado"];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *pickedImg = [info objectForKey:UIImagePickerControllerEditedImage];
        [_camaraImageView setImage:pickedImg];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
        
        NSString *path = [NSString stringWithFormat:@"%@/%.f%@",
                          [[[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSAllDomainsMask] objectAtIndex:0] path], timestamp, @".jpg"];
        
        BOOL status = [fileManager createFileAtPath:path
                             contents:UIImageJPEGRepresentation(pickedImg, 1.0)
                           attributes:nil];
        
        if (status) {
            NSLog(@"OK");
        } else {
            NSLog(@"KO");
        }
        
#ifndef NDEBUG
        NSLog(@"%s (line:%d) %@", __PRETTY_FUNCTION__, __LINE__, path);
#endif
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end

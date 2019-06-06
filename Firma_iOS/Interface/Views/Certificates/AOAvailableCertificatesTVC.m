//
//  AOAvailableCertificatesTVC.m
//  Firma_iOS
//
//  Created by Rocio Tovar on 25/3/15.
//  Copyright (c) 2015 Atos. All rights reserved.
//

#import "AOAvailableCertificatesTVC.h"
#import "GlobalConstants.h"
#import <MobileCoreServices/MobileCoreServices.h>

static NSString *const kAOAvailableCertificatesTVCCellIdentifier = @"AOCertificateFileCell";

@interface AOAvailableCertificatesTVC ()
{
    NSString *_selectedCertificate;
    NSArray *_filesArray;
}

@property (strong, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation AOAvailableCertificatesTVC

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView reloadData];
    _selectedCertificate = nil;
    _filesArray = [self findFiles:@[@"p12", @"pfx"]];
    
    if (_filesArray.count == 0) {
        _messageLabel.text = NSLocalizedString(@"certificate_instructions", nil);
    }
    
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.availableCertificatesDescriptionLabel setText:NSLocalizedString(@"available_certificates_description_label", nil)];
    self.title = NSLocalizedString(@"available_certificates", nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    _selectedCertificate = nil;
    _filesArray = nil;
}

#pragma mark - User Interaction

- (IBAction)didClickCancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)filesAppButtonTapped:(id)sender {
    UIDocumentMenuViewController *documentProviderMenu = [[UIDocumentMenuViewController alloc] initWithDocumentTypes:@[@"public.data"] inMode:UIDocumentPickerModeImport];
    documentProviderMenu.delegate = self;
    [self presentViewController:documentProviderMenu animated:YES completion:nil];
}

#pragma mark - Certificates Methods

- (NSArray *)findFiles:(NSArray *)extensions
{
#if TARGET_IPHONE_SIMULATOR
    
    NSMutableArray *arrayCertsMut = [[NSMutableArray alloc] init];
    
    [arrayCertsMut addObject:ANF_PF_ACTIVO];
    [arrayCertsMut addObject:PF_ACTIVO_FIR_SHA1];
    [arrayCertsMut addObject:PRUEBAS_PORTAFIRMAS];
    
    return arrayCertsMut;
    
#else
    
    NSMutableArray *matches = [@[] mutableCopy];
    NSFileManager *fManager = [NSFileManager defaultManager];
    NSString *item;
    NSString *ext;
    NSArray *contents = [fManager contentsOfDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:DOCUMENTS] error:nil];
    
    for (item in contents) {
        for (ext in extensions) {
            if ([[item pathExtension] isEqualToString:ext]) {
                [matches addObject:item];
            }
        }
    }
    
    return matches;
    
#endif /* if TARGET_IPHONE_SIMULATOR */
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _filesArray ? _filesArray.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAOAvailableCertificatesTVCCellIdentifier];
    cell.textLabel.text = _filesArray[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedCertificate = _filesArray[indexPath.row];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showRegisterCertificate"]) {
        if (!_selectedCertificate) {
            NSIndexPath *selectedRowIndexPath = [self.tableView indexPathForSelectedRow];
            _selectedCertificate = _filesArray[selectedRowIndexPath.row];
        }
        AORegisterCertificateVC *registerCertificateVC  = [segue destinationViewController];
        registerCertificateVC.selectedCertificate = _selectedCertificate;
        registerCertificateVC.modalPresentationStyle = 17;
        [registerCertificateVC setDelegate:self];
    }
}

#pragma mark - AORegisterCertificateVCDelegate

- (void)certificateAdded
{
    [self didClickCancelButton:nil];
}

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url {
    if (controller.documentPickerMode == UIDocumentPickerModeImport) {
	   NSString *alertMessage = [NSString stringWithFormat:@"Successfully imported %@", [url lastPathComponent]];
	   dispatch_async(dispatch_get_main_queue(), ^{
		  UIAlertController *alertController = [UIAlertController
										alertControllerWithTitle:@"Import"
										message:alertMessage
										preferredStyle:UIAlertControllerStyleAlert];
		  [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
		  [self presentViewController:alertController animated:YES completion:nil];
		  
		  NSFileManager *fileManager = [NSFileManager defaultManager];
		  NSError *copyError = nil;

		  NSURL* documentDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
		  NSURL* fileDirectory = [documentDirectory URLByAppendingPathComponent: url.lastPathComponent isDirectory:YES];

		  [fileManager copyItemAtURL:url toURL: fileDirectory error:&copyError];
		  if (!copyError)
		  {
			  NSLog(@"File has been copied correctly");
		  }
		  else
		  {
			 NSLog(@"Files app error: %@", copyError);
		  }
		  
		  [self.tableView reloadData];
	   });
    }
}

- (void)documentMenu:(nonnull UIDocumentMenuViewController *)documentMenu didPickDocumentPicker:(nonnull UIDocumentPickerViewController *)documentPicker {
    documentPicker.delegate = self;
    [self presentViewController:documentPicker animated:YES completion:nil];
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    
}

- (void)updateFocusIfNeeded {
    
}

@end

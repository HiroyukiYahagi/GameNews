// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.8 clang-703.0.31)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreData;
@import CoreGraphics;
@import XLPagerTabStrip;
@import MessageUI;
@import XLActionController;
@import WebKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;
@class NSURL;
@class NSManagedObjectModel;
@class NSPersistentStoreCoordinator;
@class NSManagedObjectContext;

SWIFT_CLASS("_TtC8GameNews11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
@property (nonatomic, strong) NSURL * _Nonnull applicationDocumentsDirectory;
@property (nonatomic, strong) NSManagedObjectModel * _Nonnull managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator * _Nonnull persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectContext * _Nonnull managedObjectContext;
- (void)saveContext;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSEntityDescription;

SWIFT_CLASS_NAMED("Article")
@interface Article : NSManagedObject
- (nonnull instancetype)initWithEntity:(NSEntityDescription * _Nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * _Nullable)context OBJC_DESIGNATED_INITIALIZER;
@end

@class NSNumber;
@class NSData;
@class NSDate;
@class Site;
@class NSMutableSet;
@class Tag;
@class UIImage;
@class NSDictionary;

@interface Article (SWIFT_EXTENSION(GameNews))
@property (nonatomic, strong) NSNumber * _Nullable id;
@property (nonatomic, copy) NSString * _Nullable title;
@property (nonatomic, copy) NSString * _Nullable image;
@property (nonatomic, strong) NSData * _Nullable imageData;
@property (nonatomic, copy) NSString * _Nullable url;
@property (nonatomic, copy) NSString * _Nullable content;
@property (nonatomic, strong) NSDate * _Nullable postDate;
@property (nonatomic, strong) Site * _Nullable site;
@property (nonatomic, strong) NSMutableSet * _Nullable tags;
@property (nonatomic, strong) NSNumber * _Nullable ranking;
@property (nonatomic, strong) NSNumber * _Nullable favorite;
- (void)addTag:(Tag * _Nonnull)tag;
- (void)setImageAndClearData:(NSString * _Nullable)image;
- (UIImage * _Nullable)getImageData:(void (^ _Nonnull)(UIImage * _Nonnull))complete;
- (void)patchDictionary:(NSDictionary * _Nonnull)dic;
@end


SWIFT_CLASS_NAMED("Category")
@interface Category : NSManagedObject
- (nonnull instancetype)initWithEntity:(NSEntityDescription * _Nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * _Nullable)context OBJC_DESIGNATED_INITIALIZER;
@end


@interface Category (SWIFT_EXTENSION(GameNews))
@property (nonatomic, strong) NSNumber * _Nullable id;
@property (nonatomic, copy) NSString * _Nullable name;
@property (nonatomic, copy) NSString * _Nullable image;
@property (nonatomic, strong) NSData * _Nullable imageData;
@property (nonatomic, strong) NSMutableSet * _Nullable sites;
- (void)addSite:(Site * _Nonnull)site;
- (void)setImageAndClearData:(NSString * _Nullable)image;
- (UIImage * _Nullable)getImageData:(void (^ _Nonnull)(UIImage * _Nonnull))complete;
- (void)patchDictionary:(NSDictionary * _Nonnull)dic;
@end

@class UIBarButtonItem;
@class UINavigationBar;
@class UITextView;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC8GameNews22ContractViewController")
@interface ContractViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified closeButton;
@property (nonatomic, weak) IBOutlet UINavigationBar * _Null_unspecified navigationBar;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified textView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)closeButtonPressed:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GameNews22EmbeddedViewController")
@interface EmbeddedViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIRefreshControl;
@class UITableView;
@class NSIndexPath;
@class UITableViewCell;
@class UIButton;
@class UIView;
@class UIActivityIndicatorView;

SWIFT_CLASS("_TtC8GameNews24ReloadableViewController")
@interface ReloadableViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified loadingView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView * _Null_unspecified activetyIndicator;
@property (nonatomic, copy) NSArray * _Nullable tableData;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (void)onRefresh:(UIRefreshControl * _Nonnull)refreshControl;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (UITableViewCell * _Nonnull)getCell:(NSIndexPath * _Nonnull)indexPath;
- (NSArray * _Nonnull)getArticles;
- (Article * _Nonnull)getArticle:(NSIndexPath * _Nonnull)indexPath;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)deleteButtonPressed:(UIButton * _Nonnull)sender;
- (void)loadButtonPressed;
- (void)preReload;
- (void)reload;
- (void)postReload;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GameNews19LaterViewController")
@interface LaterViewController : ReloadableViewController
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified rankingButton;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (void)reload;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GameNews19MovieViewController")
@interface MovieViewController : ReloadableViewController
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified rankingButton;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)reload;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class PagerTabStripViewController;
@class UIToolbar;
@class UILabel;

SWIFT_CLASS("_TtC8GameNews19MyTabViewController")
@interface MyTabViewController : ButtonBarPagerTabStripViewController
@property (nonatomic, strong) UIViewController * _Nullable childViewController;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified refreshButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified searchButton;
@property (nonatomic, weak) IBOutlet UIToolbar * _Null_unspecified toolBar;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified titleLabel;
- (NSArray<UIViewController *> * _Nonnull)viewControllersForPagerTabStrip:(PagerTabStripViewController * _Nonnull)pagerTabStripController;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)pagerTabStripViewController:(PagerTabStripViewController * _Nonnull)pagerTabStripViewController updateIndicatorFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex withProgressPercentage:(CGFloat)progressPercentage indexWasChanged:(BOOL)indexWasChanged;
- (IBAction)searchButtonPressed:(id _Nonnull)sender;
- (IBAction)settingButtonPressed:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GameNews18NewsViewController")
@interface NewsViewController : ReloadableViewController
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified rankingButton;
@property (nonatomic, copy) NSArray * _Nullable rankingData;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (UITableViewCell * _Nonnull)getCell:(NSIndexPath * _Nonnull)indexPath;
- (NSArray * _Nonnull)getArticles;
- (Article * _Nonnull)getArticle:(NSIndexPath * _Nonnull)indexPath;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (IBAction)rankingButtonPressed:(id _Nonnull)sender;
- (void)reload;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@class UISearchController;
@class UISearchBar;

SWIFT_CLASS("_TtC8GameNews20SearchViewController")
@interface SearchViewController : UIViewController <UIBarPositioningDelegate, UITableViewDelegate, UIScrollViewDelegate, UISearchResultsUpdating, UISearchBarDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
@property (nonatomic, copy) NSArray * _Nullable allData;
@property (nonatomic, copy) NSArray * _Nullable rankingData;
@property (nonatomic, copy) NSArray * _Nullable favoriteData;
@property (nonatomic, copy) NSArray * _Nullable allResults;
@property (nonatomic, copy) NSArray * _Nullable rankingResults;
@property (nonatomic, copy) NSArray * _Nullable favoriteResults;
@property (nonatomic, strong) UISearchController * _Nonnull searchController;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)loadData;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)viewWillAppear:(BOOL)animated;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (NSString * _Nullable)tableView:(UITableView * _Nonnull)tableView titleForHeaderInSection:(NSInteger)section;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSArray * _Nullable)getDataWithSectionId:(NSInteger)section;
- (void)updateSearchResultsForSearchController:(UISearchController * _Nonnull)searchController;
- (void)searchBarCancelButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UICollectionView;
@class UICollectionViewCell;
@class MFMailComposeViewController;
@class NSError;

SWIFT_CLASS("_TtC8GameNews21SettingViewController")
@interface SettingViewController : UIViewController <UIScrollViewDelegate, UICollectionViewDataSource, MFMailComposeViewControllerDelegate, UICollectionViewDelegate>
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified stopButton;
@property (nonatomic, weak) IBOutlet UINavigationBar * _Null_unspecified navigationBar;
@property (nonatomic, weak) IBOutlet UICollectionView * _Null_unspecified collectionView;
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull titles;
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull images;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)stopButtonPressed:(id _Nonnull)sender;
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView * _Nonnull)collectionView;
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section;
- (void)collectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)mailComposeController:(MFMailComposeViewController * _Nonnull)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError * _Nullable)error;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS_NAMED("Site")
@interface Site : NSManagedObject
- (nonnull instancetype)initWithEntity:(NSEntityDescription * _Nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * _Nullable)context OBJC_DESIGNATED_INITIALIZER;
@end


@interface Site (SWIFT_EXTENSION(GameNews))
@property (nonatomic, strong) NSNumber * _Nullable id;
@property (nonatomic, copy) NSString * _Nullable name;
@property (nonatomic, copy) NSString * _Nullable image;
@property (nonatomic, strong) NSData * _Nullable imageData;
@property (nonatomic, copy) NSString * _Nullable url;
@property (nonatomic, strong) Category * _Nullable category;
@property (nonatomic, strong) NSMutableSet * _Nullable articles;
- (void)addArticle:(Article * _Nonnull)article;
- (void)setImageAndClearData:(NSString * _Nullable)image;
- (UIImage * _Nullable)getImageData:(void (^ _Nonnull)(UIImage * _Nonnull))complete;
- (void)patchDictionary:(NSDictionary * _Nonnull)dic;
@end


SWIFT_CLASS_NAMED("Tag")
@interface Tag : NSManagedObject
- (nonnull instancetype)initWithEntity:(NSEntityDescription * _Nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * _Nullable)context OBJC_DESIGNATED_INITIALIZER;
@end


@interface Tag (SWIFT_EXTENSION(GameNews))
@property (nonatomic, strong) NSNumber * _Nullable id;
@property (nonatomic, copy) NSString * _Nullable name;
@property (nonatomic, copy) NSString * _Nullable color;
@property (nonatomic, strong) NSMutableSet * _Nullable articles;
- (void)addArticle:(Article * _Nonnull)article;
- (void)patchDictionary:(NSDictionary * _Nonnull)dic;
@end

@class WKWebView;

SWIFT_CLASS("_TtC8GameNews21TestWebViewController")
@interface TestWebViewController : UIViewController
@property (nonatomic, strong) WKWebView * _Nullable _webkitview;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GameNews29TwitterActionControllerHeader")
@interface TwitterActionControllerHeader : UICollectionReusableView
@property (nonatomic, strong) UILabel * _Nonnull label;
@property (nonatomic, strong) UIView * _Nonnull bottomLine;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GameNews11TwitterCell")
@interface TwitterCell : ActionCell
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)awakeFromNib;
- (void)initialize;
@end

@class UIProgressView;

SWIFT_CLASS("_TtC8GameNews17WebViewController")
@interface WebViewController : UIViewController <WKNavigationDelegate>
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified closeButton;
@property (nonatomic, strong) WKWebView * _Null_unspecified webView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified backButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified actionButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified safariButton;
@property (nonatomic, weak) IBOutlet UIProgressView * _Null_unspecified progressView;
@property (nonatomic, strong) Article * _Nullable article;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (IBAction)backButtonPressed:(id _Nonnull)sender;
- (IBAction)safariButtonPressed:(id _Nonnull)sender;
- (IBAction)shareButtonPressed:(id _Nonnull)sender;
- (IBAction)closeButtonPressed:(id _Nonnull)sender;
- (void)observeValueForKeyPath:(NSString * _Nullable)keyPath ofObject:(id _Nullable)object change:(NSDictionary<NSString *, id> * _Nullable)change context:(void * _Null_unspecified)context;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
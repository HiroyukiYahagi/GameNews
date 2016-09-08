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
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIScrollView;
@protocol UIViewControllerTransitionCoordinator;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC15XLPagerTabStrip27PagerTabStripViewController")
@interface PagerTabStripViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, strong) IBOutlet UIScrollView * _Null_unspecified containerView;
@property (nonatomic, readonly, copy) NSArray<UIViewController *> * _Nonnull viewControllers;
@property (nonatomic, readonly) NSInteger currentIndex;
@property (nonatomic, readonly) CGFloat pageWidth;
@property (nonatomic, readonly) CGFloat scrollPercentage;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewDidLayoutSubviews;
- (void)moveToViewControllerAtIndex:(NSInteger)index animated:(BOOL)animated;
- (void)moveToViewController:(UIViewController * _Nonnull)viewController animated:(BOOL)animated;
- (NSArray<UIViewController *> * _Nonnull)viewControllersForPagerTabStrip:(PagerTabStripViewController * _Nonnull)pagerTabStripController;
- (void)updateIfNeeded;
- (BOOL)canMoveToIndexWithIndex:(NSInteger)index;
- (CGFloat)pageOffsetForChildIndexWithIndex:(NSInteger)index;
- (CGFloat)offsetForChildIndex:(NSInteger)index;
- (NSInteger)pageForContentOffset:(CGFloat)contentOffset;
- (NSInteger)virtualPageForContentOffset:(CGFloat)contentOffset;
- (NSInteger)pageForVirtualPage:(NSInteger)virtualPage;
- (void)updateContent;
- (void)reloadPagerTabStripView;
- (void)scrollViewDidScroll:(UIScrollView * _Nonnull)scrollView;
- (void)scrollViewWillBeginDragging:(UIScrollView * _Nonnull)scrollView;
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView * _Nonnull)scrollView;
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator> _Nonnull)coordinator;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class BarView;

SWIFT_CLASS("_TtC15XLPagerTabStrip30BarPagerTabStripViewController")
@interface BarPagerTabStripViewController : PagerTabStripViewController
@property (nonatomic, strong) IBOutlet BarView * _Null_unspecified barView;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidLoad;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewWillAppear:(BOOL)animated;
- (void)reloadPagerTabStripView;
- (void)pagerTabStripViewController:(PagerTabStripViewController * _Nonnull)pagerTabStripViewController updateIndicatorFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
- (void)pagerTabStripViewController:(PagerTabStripViewController * _Nonnull)pagerTabStripViewController updateIndicatorFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex withProgressPercentage:(CGFloat)progressPercentage indexWasChanged:(BOOL)indexWasChanged;
@end


SWIFT_CLASS("_TtC15XLPagerTabStrip7BarView")
@interface BarView : UIView
@property (nonatomic, strong) UIView * _Nonnull selectedBar;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)moveToIndexWithIndex:(NSInteger)index animated:(BOOL)animated;
- (void)moveToIndexFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progressPercentage:(CGFloat)progressPercentage;
- (void)layoutSubviews;
@end

@class ButtonBarViewCell;
@class ButtonBarView;
@class UICollectionView;
@class UICollectionViewLayout;
@class NSIndexPath;
@class UICollectionViewCell;

SWIFT_CLASS("_TtC15XLPagerTabStrip36ButtonBarPagerTabStripViewController")
@interface ButtonBarPagerTabStripViewController : PagerTabStripViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, copy) void (^ _Nullable changeCurrentIndex)(ButtonBarViewCell * _Nullable oldCell, ButtonBarViewCell * _Nullable newCell, BOOL animated);
@property (nonatomic, copy) void (^ _Nullable changeCurrentIndexProgressive)(ButtonBarViewCell * _Nullable oldCell, ButtonBarViewCell * _Nullable newCell, CGFloat progressPercentage, BOOL changeCurrentIndex, BOOL animated);
@property (nonatomic, strong) IBOutlet ButtonBarView * _Null_unspecified buttonBarView;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidLayoutSubviews;
- (void)reloadPagerTabStripView;
- (CGFloat)calculateStretchedCellWidths:(NSArray<NSNumber *> * _Nonnull)minimumCellWidths suggestedStretchedCellWidth:(CGFloat)suggestedStretchedCellWidth previousNumberOfLargeCells:(NSInteger)previousNumberOfLargeCells;
- (void)pagerTabStripViewController:(PagerTabStripViewController * _Nonnull)pagerTabStripViewController updateIndicatorFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
- (void)pagerTabStripViewController:(PagerTabStripViewController * _Nonnull)pagerTabStripViewController updateIndicatorFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex withProgressPercentage:(CGFloat)progressPercentage indexWasChanged:(BOOL)indexWasChanged;
- (CGSize)collectionView:(UICollectionView * _Nonnull)collectionView layout:(UICollectionViewLayout * _Nonnull)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)collectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView * _Nonnull)scrollView;
@end


SWIFT_CLASS("_TtC15XLPagerTabStrip13ButtonBarView")
@interface ButtonBarView : UICollectionView
@property (nonatomic, strong) UIView * _Nonnull selectedBar;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImageView;
@class UILabel;

SWIFT_CLASS("_TtC15XLPagerTabStrip17ButtonBarViewCell")
@interface ButtonBarViewCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet UIImageView * _Null_unspecified imageView;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified label;
- (void)willMoveToSuperview:(UIView * _Nullable)newSuperview;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@class UISegmentedControl;

SWIFT_CLASS("_TtC15XLPagerTabStrip36SegmentedPagerTabStripViewController")
@interface SegmentedPagerTabStripViewController : PagerTabStripViewController
@property (nonatomic, strong) IBOutlet UISegmentedControl * _Null_unspecified segmentedControl;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidLoad;
- (void)reloadPagerTabStripView;
- (void)pagerTabStripViewController:(PagerTabStripViewController * _Nonnull)pagerTabStripViewController updateIndicatorFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView * _Nonnull)scrollView;
@end


SWIFT_CLASS("_TtC15XLPagerTabStrip34TwitterPagerTabStripViewController")
@interface TwitterPagerTabStripViewController : PagerTabStripViewController
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidLoad;
- (void)reloadPagerTabStripView;
- (void)pagerTabStripViewController:(PagerTabStripViewController * _Nonnull)pagerTabStripViewController updateIndicatorFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
- (void)pagerTabStripViewController:(PagerTabStripViewController * _Nonnull)pagerTabStripViewController updateIndicatorFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex withProgressPercentage:(CGFloat)progressPercentage indexWasChanged:(BOOL)indexWasChanged;
- (void)observeValueForKeyPath:(NSString * _Nullable)keyPath ofObject:(id _Nullable)object change:(NSDictionary<NSString *, id> * _Nullable)change context:(void * _Null_unspecified)context;
- (void)viewDidLayoutSubviews;
@end

#pragma clang diagnostic pop
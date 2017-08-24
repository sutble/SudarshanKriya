// Generated by Apple Swift version 3.0 (swiftlang-800.0.46.2 clang-800.0.38)
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
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
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
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
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
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import ObjectiveC;
@import CoreGraphics;
@import Foundation;
@import AVFoundation;
@import SpriteKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC14SudarshanKriya11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIView;
@class UIColor;

SWIFT_CLASS("_TtC14SudarshanKriya18CircularTransition")
@interface CircularTransition : NSObject
@property (nonatomic, strong) UIView * _Nonnull circle;
@property (nonatomic) CGPoint startingPoint;
@property (nonatomic, strong) UIColor * _Nonnull circleColor;
@property (nonatomic) double duration;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@protocol UIViewControllerContextTransitioning;

@interface CircularTransition (SWIFT_EXTENSION(SudarshanKriya)) <UIViewControllerAnimatedTransitioning>
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning> _Nullable)transitionContext;
- (void)animateTransition:(id <UIViewControllerContextTransitioning> _Nonnull)transitionContext;
- (CGRect)frameforCircleWithViewCenter:(CGPoint)viewCenter size:(CGSize)viewSize startPoint:(CGPoint)startPoint;
@end

@class FIRDatabaseReference;
@class NSTimer;
@class AVAudioPlayer;
@class KriyScene;
@class UILabel;
@class UIStoryboardSegue;
@class UIButton;
@class SKView;
@class UIImageView;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC14SudarshanKriya10DailyKriya")
@interface DailyKriya : UIViewController <AVAudioPlayerDelegate, UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) FIRDatabaseReference * _Nullable ref;
@property (nonatomic) NSInteger progressCounter;
@property (nonatomic) NSInteger restTime;
@property (nonatomic) NSInteger seconds;
@property (nonatomic, strong) NSTimer * _Nonnull timer;
@property (nonatomic, strong) AVAudioPlayer * _Nullable player;
@property (nonatomic, copy) NSURL * _Nullable playURL;
@property (nonatomic, readonly, copy) NSURL * _Nonnull beginSound;
@property (nonatomic, readonly, copy) NSURL * _Nonnull endSound;
@property (nonatomic, readonly, strong) UIColor * _Nonnull infoColor;
@property (nonatomic, readonly, strong) UIColor * _Nonnull highlightColor;
@property (nonatomic, readonly, strong) UIColor * _Nonnull clearColor;
@property (nonatomic, strong) KriyScene * _Nullable Kriy;
@property (nonatomic, readonly, strong) CircularTransition * _Nonnull transition;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified infoButton;
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified counter;
@property (nonatomic, weak) IBOutlet SKView * _Null_unspecified animationView;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified imageView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified circleOne;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified circleTwo;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified circleThree;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified nameText;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified timerText;
- (void)viewDidLoad;
- (void)makeList;
- (NSURL * _Nonnull)getURLWithString:(NSString * _Nonnull)string;
- (void)changeCounter:(NSInteger)number;
- (void)hideCounter;
- (void)showCounter;
- (void)backgroundColor:(UIColor * _Nonnull)color;
- (void)roundCorners;
- (void)setCircleLabel:(UILabel * _Nonnull)circle;
- (void)setTextLabel:(UILabel * _Nonnull)text size:(CGFloat)size;
- (void)showButton;
- (void)hideButton;
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer * _Nonnull)player successfully:(BOOL)flag;
- (void)playSound:(NSURL * _Nonnull)url;
- (void)showTimer;
- (void)hideTimer;
- (void)startTimer;
- (void)restCounter;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (id <UIViewControllerAnimatedTransitioning> _Nullable)animationControllerForPresentedController:(UIViewController * _Nonnull)presented presentingController:(UIViewController * _Nonnull)presenting sourceController:(UIViewController * _Nonnull)source;
- (id <UIViewControllerAnimatedTransitioning> _Nullable)animationControllerForDismissedController:(UIViewController * _Nonnull)dismissed;
- (void)sendFirUpdate;
- (NSString * _Nonnull)stringDate;
- (void)drawCenterXWithXPos:(CGFloat)xPos yPos:(CGFloat)yPos;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC14SudarshanKriya18InfoViewController")
@interface InfoViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified XButton;
- (void)viewDidLoad;
- (IBAction)dismiss:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class SKTexture;

SWIFT_CLASS("_TtC14SudarshanKriya9KriyScene")
@interface KriyScene : SKScene
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithSize:(CGSize)size OBJC_DESIGNATED_INITIALIZER;
- (NSArray<SKTexture *> * _Nonnull)getFramesWithAtlasString:(NSString * _Nonnull)atlasString count:(NSInteger)count;
- (void)startWithPosition:(CGPoint)position sceneName:(NSString * _Nonnull)sceneName;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


SWIFT_CLASS("_TtC14SudarshanKriya19StartViewController")
@interface StartViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified titleLabel;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified startButton;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)setupButton;
- (void)setupLabel;
- (void)animateButton;
- (void)successHaptic;
- (IBAction)startAction:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop

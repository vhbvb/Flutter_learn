
1、 官方简介
--

- [Flutter](https://flutter.io/)
- [Flutter中文网](https://flutterchina.club/)


Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。
<br/>
<br/>
**官方介绍**：
1. **快速开发:** 毫秒级的热重载，修改后，您的应用界面会立即更新。使用丰富的、完全可定制的widget在几分钟内构建原生界面。
2. **富有表现力和灵活的UI**: 快速发布聚焦于原生体验的功能。分层的架构允许您完全自定义，从而实现难以置信的快速渲染和富有表现力、灵活的设计
3. **原生性能**: Flutter包含了许多核心的widget，如滚动、导航、图标和字体等，这些都可以在iOS和Android上达到原生应用一样的性能。


<br/>

![1.jpeg](http://note.youdao.com/yws/res/9023/WEBRESOURCE76d5e10828aed788e63e6c13d65fc204)

<br/>
<br/>

2、安装环境
--

- 1. 下载FlutterSDK: https://github.com/flutter/flutter/releases
- 2. 配置vscode编辑器：https://flutterchina.club/get-started/editor/#vscode
<br/>附：[vs下载地址](https://code.visualstudio.com/)
- 3. vscode 命令运行flutter doctor，会提示你设置flutterSDK路径 （如果遇到权限问题需要用Sudo chown命令，如果遇到文件夹不存在需要手动创建对应的文件夹）
- 4. 构建第一个Flutter程序：

    ```objc
    创建程序 ：VSCode -> View -> Command palette : Flutter NewProject
    
    运行程序 ：Debug -> Start Debuging 
    
    注意事项 ：如果遇到 Multiple commands produce 错误，cocoapods导入问题，尝试修改build system：
    在Xcode菜单栏 -> File -> Workspace Setting，将build system修改为legacy build system，然后clean后编译。
    ```
- 5. Hello World!:
    
    ```
    void main() => runApp(Center(child:Text("hello,world!",textDirection: TextDirection.ltr)));
    ```
- 附:
[Pubspec Format 介绍](https://www.dartlang.org/tools/pub/pubspec)


3、Widget介绍
--

官方布局介绍：https://flutterchina.club/tutorials/layout/

链接：https://flutterchina.club/widgets-intro/

**基础Widget：**


- [MaterialApp](https://docs.flutter.io/flutter/material/MaterialApp-class.html)：该widget在应用程序的根部创建了一些有用的widget，其中包括一个Navigator， 它管理由字符串标识的Widget栈（即页面路由栈）。Navigator可以让您的应用程序在页面之间的平滑的过渡。

- [Scaffold](https://docs.flutter.io/flutter/material/Scaffold-class.html)：实现MaterialDesign布局Widget, 此类提供tabbar，navigationBar和bottomSheets等


- [Row](https://docs.flutter.io/flutter/widgets/Row-class.html)、 [Column](https://docs.flutter.io/flutter/widgets/Column-class.html)： 这些具有弹性空间的布局类Widget可让您在水平（Row）和垂直（Column）方向上创建灵活的布局。其设计是基于web开发中的Flexbox布局模型。
- [Stack](https://docs.flutter.io/flutter/widgets/Stack-class.html)： 取代线性布局 (译者语：和Android中的LinearLayout相似)，Stack允许子 widget 堆叠， 你可以使用 Positioned 来定位他们相对于Stack的上下左右四条边的位置。Stacks是基于Web开发中的绝度定位（absolute positioning )布局模型设计的。
- [Container](https://docs.flutter.io/flutter/widgets/Container-class.html)： Container 可让您创建矩形视觉元素。container 可以装饰为一个BoxDecoration, 如 background、一个边框、或者一个阴影。 Container 也可以具有边距（margins）、填充(padding)和应用于其大小的约束(constraints)。另外， Container可以使用矩阵在三维空间中对其进行变换。

当然还有常用的其他一些Widget就不一一罗列了，exam：Padding、Image、Clip... 

https://flutterchina.club/widgets/

但是有必要说一下：Cupertino系列Widget是基于iOS设计语言的Widget风格

4、动画
--
**官方详细介绍**：https://flutterchina.club/animations/

**个人总结**：

Flutter 动画不同于iOS动画，一个block执行一个动画

Flutter的动画的核心类为：
- AnimationController：控制动画的开始，暂停，与结束，它不关心我在执行什么动画
- Animation：这个是一个抽象类，决定动画的数据和变化方式等，可以通过addListener去监听其Value的变化，初始化的时候需要一个AnimationController；

开始一段动画过程:

1. AnimationController.forward();//开始动画
2. Animation.value 发生变化，并执行Animation.notifyListener()
3. 监听函数执行 setState()
4. 子Widget 根据Animation的value值进行布局

总结:就是不停的根据Animation的变化进行setState()，Flutter的动画并不关心Widget的布局方式等，只提供动画的数据模型

5、界面跳转
--
使用了 Navigator 和 Routes。一个路由是 App 中“屏幕”或“页面”的抽象，而一个 Navigator 是管理多个路由的 widget 。你可以粗略地把一个路由对应到一个 UIViewController。Navigator 的工作原理和 iOS 中 UINavigationController 非常相似，当你想跳转到新页面或者从新页面返回时，它可以 push() 和 pop() 路由。

**两种方式跳转：**

- 构建路由表

```
void main() {
  runApp(MaterialApp(
    home: MyAppHome(), // becomes the route named '/'
    routes: <String, WidgetBuilder> {
      '/a': (BuildContext context) => MyPage(title: 'page A'),
      '/b': (BuildContext context) => MyPage(title: 'page B'),
      '/c': (BuildContext context) => MyPage(title: 'page C'),
    },
  ));
}

//跳转
Navigator.of(context).pushNamed('/b');
```

- 直接通过widget创建一个路由

```
Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new FTShareHomePage(title: "ShareSDK Flutter Bridge"),
                // fullscreenDialog: true,
              ));
```

- 数据回传


```
//比如push到位置选择界面
Map coordinates = await Navigator.of(context).pushNamed('/location');

//用户选择了位置pop出来
Navigator.of(context).pop({"lat":43.821757,"long":-79.226392});
```

6、Dart中的异步
-
##### 1. 先了解代码怎么写

```
Future<Map> loadData() async {
  String dataURL = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(dataURL);
  return json.decode(response.body);
}

//调用
loadData().then((Map data){
    
});
```

##### 2. 原理其实不重要 （手动滑稽）

- **官方介绍：**

    Dart 是单线程执行模型，但是它支持 Isolate（一种让 Dart 代码运行在其他线程的方式）、事件循环和异步编程。除非你自己创建一个 Isolate ，否则你的 Dart 代码永远运行在 UI 线程，并由 event loop 驱动。Flutter 的 event loop 和 iOS 中的 main loop 相似——Looper 是附加在主线程上的。

    Dart 的单线程模型并不意味着你写的代码一定是阻塞操作，从而卡住 UI。相反，使用 Dart 语言提供的异步工具，例如 async / await ，来实现异步操作。

- **进阶介绍：**

    [Flutter,你是怎么把工作放到后台线程的？](https://flutterchina.club/flutter-for-ios/#%E4%BD%A0%E6%98%AF%E6%80%8E%E4%B9%88%E6%8A%8A%E5%B7%A5%E4%BD%9C%E6%94%BE%E5%88%B0%E5%90%8E%E5%8F%B0%E7%BA%BF%E7%A8%8B%E7%9A%84)
    
7、与原生进行交互
--
官方介绍链接: https://flutterchina.club/platform-channels/

##### 介绍

- 应用的Flutter部分通过平台通道（platform channel）将消息发送到其应用程序的所在的宿主（iOS或Android）。

- 宿主监听的平台通道，并接收该消息。然后它会调用特定于该平台的API（使用原生编程语言）

##### 代码示例（分享到第三方平台）：
- dart代码怎么写

```
//创建一个channel
  static const channel = const MethodChannel('com.mob.flutter/sharesdk');

// invokeMethod 方法执行原生方法
  static Future<Map> share(int platform, Map params) async {
    return await channel.invokeMethod("share", [platform, params]);
  }
```

- 原生层：

```objc
- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel *channel = [FlutterMethodChannel
                                     methodChannelWithName:@"com.mob.flutter/sharesdk"
                                     binaryMessenger:controller];
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if ([call.method isEqualToString:@"share"])
            {
                NSMutableDictionary *params = @{}.mutableCopy;
                NSArray *args = call.arguments;
                [params SSDKSetupShareParamsByText:args.lastObject[@"text"] images:args.lastObject[@"images"] url:args.lastObject[@"url"] title:args.lastObject[@"title"] type:SSDKContentTypeAuto];
                [ShareSDK share:[args.firstObject integerValue]
                     parameters:params
                 onStateChanged:^(SSDKResponseState state,
                                  NSDictionary *userData,
                                  SSDKContentEntity *contentEntity,
                                  NSError *error) {
                     
                     NSMutableDictionary *dic = @{}.mutableCopy;
                     dic[@"state"] = @(state);
                     dic[@"userData"] = userData;
                     dic[@"contentEntity"] = contentEntity.dictionaryValue;
                     dic[@"error"] = error.userInfo;
                     if (result)
                     {
                         result(dic);
                     }
                 }];
            }
        });
        
    }];
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
```

##### 注意：

- 通道的客户端和宿主通过通道构造函数中传递的通道名称进行连接。单个应用中使用的所有通道名称必须是不同的; 我们建议在通道名称前加一个特殊的“域名前缀”，例如 *samples.flutter.io/battery*（flutter 中文网google翻译害死人）

- setMethodCallHandler 回调不在主线程

8、开发Package
--
官方介绍链接： https://flutterchina.club/developing-packages/

##### 步骤：

- 1. 创建一个Package工程

    ```sh
    flutter create --template=package hello
    #指定org可以自动创建平台桥接文件和example示例
    path_to_fluttersdk/bin/flutter create --org com.yoozoo --template=plugin sharesdk
    ```
    
- 2. 实现package：lib/<package name>.dart下为插件的flutter端代码，ios/Classes/HelloPlugin.m 下为 原生层实现代码，初始代码已有bridge示例

- 3. 启动xcode，插件bridge文件在Pods/Development
Pods/hello/Classes/下：在编辑Xcode中的iOS平台代码之前，首先确保代码至少已经构建过一次（例如，从Xcode中运行示例应用程序或终端执行cd hello/example; flutter build ios --no-codesign）。

- 4. 自动生成api文档：

    ```
    cd package工程目录
    
    export FLUTTER_ROOT=~/dev/flutter
    
    $FLUTTER_ROOT/bin/cache/dart-sdk/bin/dartdoc
    ```

- 5. 发布前检查：

    ```
    //过程会提示你完善pubspec.yaml，关于example和test的警告可无视
    flutter packages pub publish --dry-run
    ```
- 6. 发布：

    ```
    flutter packages pub publish
    ```
- 关于分包：
    对于ShareSDK和支付这样的Plugin需要分包且cocoapods含有subspec的，需要开发者在设置完dependences后手动去 packageName.podspec 设置对应的依赖，然后运行 Flutter upgrade package

    ```
    #
    # To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
    #
    Pod::Spec.new do |s|
      s.name             = 'sharesdk_flutter'
      s.version          = '0.0.1'
      s.summary          = 'flutter plugin for sharesdk.'
      s.description      = 'ShareSDK is the most comprehensive Social SDK in the world,which share easily with 40+ platforms.'
      s.homepage         = 'http://www.mob.com'
      s.license          = { :file => '../LICENSE' }
      s.author           = { 'Mob' => 'mobproducts@163.com' }
      s.source           = { :path => '.' }
      s.source_files = 'Classes/**/*'
      s.public_header_files = 'Classes/**/*.h'
      s.dependency 'Flutter'
      s.dependency 'mob_sharesdk'
    #  s.dependency 'mob_sharesdk/ShareSDKUI'
    #  s.dependency 'mob_sharesdk/ShareSDKPlatforms/QQ'
    #  s.dependency 'mob_sharesdk/ShareSDKPlatforms/SinaWeibo'
    #  s.dependency 'mob_sharesdk/ShareSDKPlatforms/WeChat'
    #  s.dependency 'mob_sharesdk/ShareSDKPlatforms/Facebook'
    #  s.dependency 'mob_sharesdk/ShareSDKPlatforms/Twitter'
      
      s.ios.deployment_target = '8.0'
    end
    ```
    
- **附:** 
    - ShareSDK官方package主页:https://pub.dartlang.org/packages/sharesdk
    - 个人学习Demo github地址: https://github.com/vhbvb/Flutter_learn
    - ShareSDK package开发git: https://github.com/MobClub/ShareSDK-For-Flutter
    
<br/>

参考链接:
--

1. [深入了解Flutter界面开发（强烈推荐）](https://mp.weixin.qq.com/s/z2r2OmnY7r7dQrkO8ndkFQ)
2. [沉浸式ListView](https://juejin.im/post/5a3325676fb9a0451c3a6ebe)
3. [为什么移动端跨平台开发不靠谱？](https://juejin.im/post/59f2346df265da430d573fd8)
4. [国内少有的Flutter干货分享：Flutter的原理及美团的实践！](http://blog.itpub.net/31077337/viewspace-2199818/)
5. [头条 Flutter 混合工程实践](https://mp.weixin.qq.com/s?__biz=MzU4MjAzNTAwMA==&mid=2247484584&idx=1&sn=4255a459e564339ab81224c551a1bf6c&chksm=fdbf37ffcac8bee9d00fb991b57e62ebaf5f910756139c98f1fbd545bab94c8a2f11e2b95024&mpshare=1&scene=23&srcid=1105JwhHdzbOqAw9O0uE2ZSR)
6. [Flutter 跨平台方案介绍](https://m.imooc.com/article/30436)
7. [与RN的性能对比](https://yq.aliyun.com/articles/637499?spm=a2c4e.11628350.blogcont.1.1f741260znzYpa)


**个人爬坑记录：**
-  如何给图片设置圆角
    - Clip系列的Widget可以尝试一下，比如 ClipRRect。这种装饰反而不好做    
-  如何设置图片Slice
    - image Widget有slice属性，但是注意你的图片一定要在拉伸状态，否则会显示异常
    
-  如何设置默认ListView 底部显示
    - ListView 的reverse 设置成true 然后吧scroll的offset设置成 0 既可以，使用与 IM 消息列表等场景
    
-  ListView 沉浸式状态栏怎么弄的
    - ListView 默认会偏离状态栏，目前解决方案是scrollable + column 

-  如何优雅的设置键盘弹出偏移动画
    - 嵌套一个safaArea widget，会默认偏移
    
-  如何解决 ListView Widget复用问题
    - AutomaticKeepAliveClientMixin

-  多继承问题怎么解决
    - mixin, 什么是mixin ：https://blog.csdn.net/awftnaaa/article/details/52885155
-  slider默认padding怎么解决
    - 默认slider 左右总是有默认边距，个人觉得需要自定slider去解决  

...

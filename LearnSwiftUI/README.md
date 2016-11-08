# LearnSwiftUI

+ 自定义打印

    [自定义打印配置](http://www.jianshu.com/p/85a2e9da1331)

    [自定义打印文件](https://github.com/wangyingbo/LearnSwift/blob/master/LearnSwiftUI/00-testDelegate-PublicMethod/testDelegate/PublicMethod.swift)


+ 添加文件路径

    直接把视频文件拖拽进去的话一般来说在bundle里时找不到文件的，只能在`TARGETS`->`Build Phases`->`Copy Bundle Resources`里手动添加才能找到文件路径
    
        let bundleDBPath:String? = NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")
        let url = NSURL.fileURLWithPath(bundleDBPath!)
        
+ 占位
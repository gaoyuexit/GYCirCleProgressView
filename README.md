# GYCirCleProgressView
带有百分比的圆弧形进度条

![效果](https://github.com/gaoyuexit/GYCirCleProgressView/blob/master/12.gif)

###用法

```objc
GYCircleProgressView *progressView = [[GYCircleProgressView alloc] initWithFrame:CGRectMake(150, 20, 100, 100)];
[progressView setProgress:0.83 animated:YES];
[self.view addSubview:progressView];

```
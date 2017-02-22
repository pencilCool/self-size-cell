# 问题：
几个uilabel 通过 autolayout 约束了cell 中 contentview 的高度，cell 中的图片又需要根据这个高度来布局。
仅仅将图片的约束添加到contentView 上是不够的，因为这样会反过来影响了cell的高度，可能导致uilabel的拉伸。
## 解决方案：
1. 将uilabel的抗拉升属性 设置成251（高于默认值250）

```
   [self.titleLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisVertical];
```
2. 图片的约束设置为低优先级

```
        make.top.equalTo(self.contentView.mas_top).with.priorityLow();
        make.bottom.equalTo(self.contentView.mas_bottom).with.priorityLow();
```

---
title: 算法竞赛C++语言基础：从C到C++的完整指南
date: 2025-11-15 10:00:00
categories: 算法竞赛
tags: [C++, C语言, STL, 算法竞赛, 编程基础]
cover: /images/autumn-9912300_1920.jpg
mathjax: true
---

# 算法竞赛C++语言基础：从C到C++的完整指南

> 🎓 本文就像一对一的私教课,用最通俗易懂的方式,带你从零基础掌握算法竞赛必备的C/C++知识!

<!-- more -->

## 📚 学习路线图

```
第一站: C语言基础 → 第二站: C++新特性 → 第三站: STL神器库 → 终点: 竞赛实战
```

---

## 1️⃣ C语言基础语法

> **👨‍🏫 开场白**：C语言是所有编程的基石。就像学武功要先扎马步一样,学编程要先打好C语言的基础!

### 1.1 基本数据类型

#### 整型类型 - 装数字的盒子

**💭 先来个灵魂拷问:为什么有这么多种整型?**

想象你去超市买饮料:
- 小瓶装(char): 装得少,但便宜(省内存)
- 中瓶装(int): 最常用,性价比高
- 大瓶装(long long): 能装更多,但占地方

数据类型也是同样道理!

```c
#include <stdio.h>
#include <limits.h>

int main() {
    /*
     * char: 最小的整型盒子
     * 💡 虽然名字是"字符",但本质是整数!
     * 💡 'A'的ASCII码是65,所以char c = 'A'就是c = 65
     */
    char c = 'A';              // 1字节,-128 ~ 127
    printf("字符'A'的ASCII码: %d\n", c);  // 输出65
    
    /*
     * unsigned: "无符号"版本
     * 💡 不存负数,把负数的空间让给正数
     * 💡 范围扩大一倍!
     */
    unsigned char uc = 255;    // 1字节,0 ~ 255
    
    /*
     * short: 短整型
     * 💡 用得比较少,介于char和int之间
     */
    short s = 32767;           // 2字节,-32768 ~ 32767
    
    /*
     * int: 最常用的整型!⭐
     * 💡 90%的情况用int就够了
     * 💡 范围: -21亿 ~ +21亿
     * ⚠️ 警告: 超过21亿会溢出!
     */
    int i = 2147483647;        // 4字节,-2^31 ~ 2^31-1
    printf("int最大值: %d\n", INT_MAX);  // 2147483647
    
    /*
     * long long: 超大号整型!⭐⭐
     * 💡 数据范围>10^9时必用!
     * 💡 两个大数相乘时也要用!
     * 💡 后缀LL表示这是long long字面量
     */
    long long ll = 9223372036854775807LL;  // 8字节
    printf("long long最大值: %lld\n", LLONG_MAX);
    
    // 🎯 实战案例: 溢出问题
    int a = 100000;
    int b = 100000;
    int product1 = a * b;  // ❌ 溢出!因为10^10超过int范围
    long long product2 = (long long)a * b;  // ✅ 正确!先转long long
    
    printf("错误结果(溢出): %d\n", product1);  
    printf("正确结果: %lld\n", product2);  // 10000000000
    
    return 0;
}
```

**📊 整型选择速查表**

| 数据范围 | 推荐类型 | 原因 |
|---------|---------|------|
| ≤ $10^4$ | `int` | 小数字 |
| ≤ $10^9$ | `int` | 标准范围 |
| > $10^9$ | `long long` | 大数字 |
| 两数相乘 | `long long` | $10^5 \times 10^5 = 10^{10}$ |

**❓ 新手常见问题**

**Q: 什么时候会溢出？怎么避免？**
```c
// 案例1: 计算n的阶乘
int n = 20;
int fact = 1;
for (int i = 1; i <= n; i++) {
    fact *= i;  // ❌ 20!太大,int装不下!
}

// ✅ 解决: 用long long
long long fact = 1;
for (int i = 1; i <= n; i++) {
    fact *= i;  // ✅ long long能装下20!
}
```

**Q: unsigned什么时候用？**
- ✅ 适合:数组下标、计数、位运算
- ❌ 不适合:可能出现减法变负数的情况
```c
unsigned int a = 5;
unsigned int b = 10;
unsigned int c = a - b;  // ⚠️ 期望-5,实际是一个超大正数!
printf("%u\n", c);  // 输出4294967291 (2^32 - 5)
```

---

#### 浮点类型 - 装小数的盒子

**💭 为什么不能用整数表示所有数字？**

想象你要分蛋糕:
- 3个人分10块 → 每人3.333...块 (无限小数)
- 计算圆的面积 → π = 3.14159... (无理数)

所以我们需要浮点数!

```c
#include <stdio.h>
#include <math.h>

int main() {
    /*
     * float: 单精度浮点数
     * 💡 精度低,只保证6-7位有效数字
     * 💡 竞赛中基本不用!
     * 💡 后缀f表示float类型
     */
    float f = 3.14159f;
    printf("float: %.10f\n", f);  // 输出: 3.1415898800 (精度不够!)
    
    /*
     * double: 双精度浮点数⭐⭐⭐
     * 💡 精度高,保证15-16位有效数字
     * 💡 竞赛标配!有小数就用double
     */
    double d = 3.14159265358979;
    printf("double: %.15lf\n", d);  // 输出: 3.141592653589790
    
    // 🎯 浮点数的精度问题
    double a = 0.1;
    double b = 0.2;
    double c = a + b;
    printf("0.1 + 0.2 = %.20lf\n", c);  
    // 输出: 0.30000000000000004441 (不是0.3!)
    // 原因: 0.1和0.2在二进制中是无限循环小数
    
    // ✅ 正确的浮点数比较方法
    const double EPS = 1e-9;  // 误差容忍度(epsilon)
    if (fabs(c - 0.3) < EPS) {  // fabs是浮点数绝对值
        printf("可以认为c等于0.3\n");
    }
    
    return 0;
}
```

**⚠️ 浮点数大坑警告**

```c
// ❌ 坑1: 直接用==比较
double x = 0.1 + 0.2;
if (x == 0.3) {  // ❌ 永远不会成立!
    printf("相等\n");
}

// ✅ 正确做法: 判断差值是否足够小
const double EPS = 1e-9;
if (fabs(x - 0.3) < EPS) {  // ✅ 这才对!
    printf("相等\n");
}

// ❌ 坑2: 循环条件用浮点数
for (double i = 0; i != 1.0; i += 0.1) {  // ❌ 可能死循环!
    printf("%.1f ", i);
}

// ✅ 正确做法: 用整数控制循环
for (int i = 0; i < 10; i++) {
    double x = i * 0.1;
    printf("%.1f ", x);
}
```

**�� 记忆口诀**
- 需要小数 → 用`double`
- 比较相等 → 用`fabs(a - b) < EPS`
- 循环控制 → 用`int`,不用`double`

---

### 1.2 输入输出 - 程序的嘴和耳朵

> **👨‍🏫 类比**：程序像一个人,scanf是"耳朵"(听输入),printf是"嘴巴"(说输出)

#### scanf 和 printf 详解

```c
#include <stdio.h>

int main() {
    int a, b;
    double x;
    char c;
    
    /*
     * scanf: 从键盘读取输入
     * 💡 格式: scanf("格式串", 变量地址1, 变量地址2, ...);
     * 💡 &表示"取地址",必须加!(数组除外)
     * 💡 空白字符(空格、Tab、回车)会自动跳过
     */
    
    // 读取两个整数
    printf("输入两个整数: ");
    scanf("%d %d", &a, &b);  // 可以输入"3 5"或"3   5"或"3\n5"
    
    // 读取一个小数
    printf("输入一个小数: ");
    scanf("%lf", &x);  // ⚠️ double输入用%lf,不是%f!
    
    // 读取一个字符
    printf("输入一个字符: ");
    scanf(" %c", &c);  // 💡 %c前加空格,跳过前面的空白字符
    
    /*
     * printf: 向屏幕输出
     * 💡 格式: printf("格式串", 表达式1, 表达式2, ...);
     * 💡 不需要&!
     */
    
    // 基本输出
    printf("a = %d, b = %d\n", a, b);
    printf("a + b = %d\n", a + b);  // 可以直接写表达式
    
    // 格式化输出
    printf("%5d\n", 123);       // "  123" (宽度5,右对齐)
    printf("%-5d\n", 123);      // "123  " (宽度5,左对齐)
    printf("%05d\n", 123);      // "00123" (宽度5,填0)
    printf("%.2lf\n", 3.1415);  // "3.14" (保留2位小数)
    printf("%10.2lf\n", 3.14);  // "      3.14" (宽度10,保留2位小数)
    
    return 0;
}
```

**📋 格式说明符终极表**

| 类型 | 输入 | 输出 | 示例 |
|------|------|------|------|
| int | `%d` | `%d` | `scanf("%d", &x)` |
| long long | `%lld` | `%lld` | `scanf("%lld", &x)` |
| unsigned int | `%u` | `%u` | `scanf("%u", &x)` |
| float | `%f` | `%f` | `scanf("%f", &x)` |
| double | `%lf` | `%f`或`%lf` | `scanf("%lf", &x)` |
| char | `%c` | `%c` | `scanf(" %c", &c)` |
| 字符串 | `%s` | `%s` | `scanf("%s", str)` |

**⚠️ 新手必踩的坑**

```c
// ❌ 错误1: 忘记&
int x;
scanf("%d", x);  // ❌ 程序崩溃!

// ✅ 正确
scanf("%d", &x);  // ✅ 必须用&取地址

// ❌ 错误2: long long用%d
long long x;
scanf("%d", &x);  // ❌ 只读了一半数据!

// ✅ 正确
scanf("%lld", &x);  // ✅ long long必须用%lld

// ❌ 错误3: double输入用%f
double x;
scanf("%f", &x);  // ❌ 数据不对!

// ✅ 正确
scanf("%lf", &x);  // ✅ double输入必须用%lf (输出可以用%f或%lf)

// ❌ 错误4: 字符前不加空格
int n;
char c;
scanf("%d", &n);
scanf("%c", &c);  // ❌ 会读到换行符!

// ✅ 正确
scanf(" %c", &c);  // ✅ %c前加空格,跳过空白字符
```

---


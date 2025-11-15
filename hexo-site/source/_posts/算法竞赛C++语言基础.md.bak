---
title: 算法竞赛C++语言基础：从C到C++的完整指南
date: 2025-11-15 10:00:00
categories: 算法竞赛
tags: [C++, C语言, STL, 算法竞赛, 编程基础]
cover: /images/autumn-9912300_1920.jpg
mathjax: true
---

# 算法竞赛C++语言基础：从C到C++的完整指南

> 本文系统讲解算法竞赛中必备的C/C++语言基础知识，包括C语言核心语法、从C到C++的进阶，以及STL标准模板库的使用技巧。

<!-- more -->

## 📚 目录

1. [C语言基础语法](#c语言基础语法)
2. [从C到C++的转变](#从c到c的转变)
3. [C++ STL标准模板库](#c-stl标准模板库)
4. [算法竞赛常用技巧](#算法竞赛常用技巧)

---

## 1️⃣ C语言基础语法

### 1.1 基本数据类型

#### 整型类型

```c
#include <stdio.h>
#include <limits.h>

int main() {
    // 基本整型
    char c = 'A';              // 1字节，-128 ~ 127
    unsigned char uc = 255;    // 1字节，0 ~ 255
    
    short s = 32767;           // 2字节，-32768 ~ 32767
    unsigned short us = 65535; // 2字节，0 ~ 65535
    
    int i = 2147483647;        // 4字节，-2^31 ~ 2^31-1
    unsigned int ui = 4294967295U; // 4字节，0 ~ 2^32-1
    
    long l = 2147483647L;      // 4或8字节（取决于系统）
    long long ll = 9223372036854775807LL; // 8字节，-2^63 ~ 2^63-1
    
    // 打印范围
    printf("int范围: %d ~ %d\n", INT_MIN, INT_MAX);
    printf("long long范围: %lld ~ %lld\n", LLONG_MIN, LLONG_MAX);
    
    return 0;
}
```

#### 浮点类型

```c
#include <stdio.h>

int main() {
    float f = 3.14159f;        // 4字节，精度约6-7位
    double d = 3.14159265358979; // 8字节，精度约15-16位
    long double ld = 3.14159265358979323846L; // 10-16字节
    
    printf("float: %.7f\n", f);
    printf("double: %.15lf\n", d);
    
    return 0;
}
```

---

### 1.2 输入输出

#### 标准输入输出

```c
#include <stdio.h>

int main() {
    int a, b;
    
    // 输入
    scanf("%d %d", &a, &b);
    
    // 输出
    printf("a = %d, b = %d\n", a, b);
    printf("a + b = %d\n", a + b);
    
    // 格式化输出
    printf("%5d\n", 123);      // 右对齐，宽度5
    printf("%-5d\n", 123);     // 左对齐，宽度5
    printf("%05d\n", 123);     // 用0填充
    printf("%.2f\n", 3.1415);  // 保留2位小数
    
    return 0;
}
```

#### 字符串输入输出

**C语言中的字符串是什么？**
- 字符串就是字符的数组,例如"Hello"就是{'H','e','l','l','o','\0'}
- ⚠️ 注意末尾有个'\0'(空字符),表示字符串结束!
- 声明时要多留一个位置给'\0',例如存5个字符要char str[6]

```c
#include <stdio.h>
#include <string.h>

int main() {
    char str1[100];  // 能存99个字符(最后一个留给'\0')
    char str2[100];
    
    // 方法1: scanf读取单词（遇到空格/换行就停止）
    printf("输入一个单词: ");
    scanf("%s", str1);
    // 💡 注意:字符串不加&! 因为数组名本身就是地址
    // ⚠️ 缺点:不能读入带空格的字符串,例如"Hello World"只能读到"Hello"
    
    // 方法2: fgets读取一整行（包括空格）
    getchar();  // 💡 吃掉上一个scanf留下的换行符(重要!)
    printf("输入一行文本: ");
    fgets(str2, sizeof(str2), stdin);
    // 💡 fgets会把换行符也读进来,需要手动去掉
    
    // 去掉fgets读入的换行符
    str2[strcspn(str2, "\n")] = '\0';
    // 💡 strcspn找到'\n'的位置,用'\0'替换掉
    
    printf("你输入的单词: %s\n", str1);
    printf("你输入的一行: %s\n", str2);
    
    return 0;
}
```

**新手常见问题❓**

**Q1: 为什么scanf读字符串不加&？**
```c
char str[100];
scanf("%s", str);  // ✅ 不加&

int x;
scanf("%d", &x);   // ✅ 要加&
```
- 因为数组名`str`本身就代表数组的首地址
- 而变量`x`需要用`&x`才能取到地址
- 简单记忆:数组不加&,普通变量加&

**Q2: scanf读字符串后为什么要getchar()？**
```c
scanf("%s", str1);
getchar();  // 如果不加这行
fgets(str2, 100, stdin);  // fgets会直接读到换行符,str2为空!
```
- scanf读完后,输入缓冲区还剩一个'\n'
- 如果直接用fgets,会把'\n'当作一行读入
- 所以要用getchar()把'\n'消耗掉

**Q3: 什么时候用scanf,什么时候用fgets？**
- 读单个单词 → 用`scanf("%s", str)`
- 读一整行(可能有空格) → 用`fgets(str, size, stdin)`
- 读多个单词 → 用`scanf("%s%s%s", s1, s2, s3)`

---

### 1.3 控制结构

> **老师说**：程序不是从上到下直直地跑,而是会"思考"(判断)和"重复"(循环)。这就像你做题:先判断题型,再重复计算步骤!

#### 条件语句

**什么是条件语句？**
- 让程序根据不同情况做不同的事
- 就像生活中的"如果...那么..."
- 例如:如果下雨,那么带伞;否则,不带伞

```c
#include <stdio.h>

int main() {
    int score;
    scanf("%d", &score);
    
    // if-else: 最常用的条件语句
    if (score >= 90) {
        printf("优秀\n");
    } else if (score >= 80) {
        printf("良好\n");
    } else if (score >= 60) {
        printf("及格\n");
    } else {
        printf("不及格\n");
    }
    // 💡 执行流程:从上往下判断,第一个满足的就执行,其他的跳过
    // 💡 else if可以有多个,else可以省略
    
    // 三元运算符: if-else的简化写法
    int a = 10, b = 20;
    int max = (a > b) ? a : b;
    // 💡 格式: 条件 ? 值1 : 值2
    // 💡 意思: 如果条件成立,返回值1;否则返回值2
    // 💡 相当于: if (a > b) max = a; else max = b;
    
    // switch-case: 适合多个固定值的判断
    char grade;
    scanf(" %c", &grade);  // 💡 注意%c前有个空格,跳过空白字符
    switch (grade) {
        case 'A':
            printf("优秀\n");
            break;  // 💡 break很重要!不加会继续执行下面的case
        case 'B':
            printf("良好\n");
            break;
        case 'C':
            printf("及格\n");
            break;
        default:  // 💡 default是"其他情况",相当于else
            printf("不及格\n");
    }
    // ⚠️ switch只能判断整数和字符,不能判断浮点数和字符串
    
    return 0;
}
```

**条件表达式技巧:**

```c
// 逻辑运算符
if (x > 0 && x < 10) { }   // 💡 &&表示"并且"(AND),两个条件都要满足
if (x < 0 || x > 10) { }   // 💡 ||表示"或者"(OR),满足一个即可
if (!(x == 0)) { }         // 💡 !表示"取反"(NOT),相当于x != 0

// 短路求值
if (a != 0 && b / a > 1) { }  // 💡 如果a==0,后面的b/a不会执行(避免除0错误)
if (a == 0 || b / a > 1) { }  // 💡 如果a==0,后面的b/a不会执行
```

**新手常见错误❌**

```c
// ❌ 错误1: 用=而不是==
if (x = 5) { }  // ❌ 这是赋值,不是比较! x会变成5,条件永远成立

// ✅ 正确写法
if (x == 5) { }  // ✅ 这才是比较

// ❌ 错误2: switch忘记break
switch (x) {
    case 1:
        printf("A\n");  // 如果x==1,会输出A、B、C
    case 2:
        printf("B\n");
    case 3:
        printf("C\n");
}

// ✅ 正确写法
switch (x) {
    case 1:
        printf("A\n");
        break;  // ✅ 加break才能跳出
    case 2:
        printf("B\n");
        break;
    case 3:
        printf("C\n");
        break;
}
```

#### 循环语句

**什么是循环？**
- 重复执行一段代码,直到满足退出条件
- 就像你抄10遍课文,不用写10次代码,用循环1次就搞定!
- 算法题中90%的代码都需要循环

```c
#include <stdio.h>

int main() {
    // for循环: 次数明确时最常用
    for (int i = 0; i < 10; i++) {
        printf("%d ", i);
    }
    printf("\n");
    // 💡 格式: for (初始化; 条件; 更新) { 循环体 }
    // 💡 执行流程:
    //    1. 执行"int i = 0"(只执行1次)
    //    2. 判断"i < 10"是否成立
    //    3. 如果成立,执行循环体,然后执行"i++"
    //    4. 回到步骤2
    // 💡 输出: 0 1 2 3 4 5 6 7 8 9 (注意:没有10!)
    
    // while循环: 次数不明确时使用
    int i = 0;
    while (i < 10) {
        printf("%d ", i);
        i++;
    }
    printf("\n");
    // 💡 格式: while (条件) { 循环体 }
    // 💡 特点: 先判断条件,再执行循环体
    // 💡 如果条件一开始就不成立,一次都不会执行
    
    // do-while循环: 至少执行一次
    i = 0;
    do {
        printf("%d ", i);
        i++;
    } while (i < 10);
    printf("\n");
    // 💡 格式: do { 循环体 } while (条件);
    // 💡 特点: 先执行循环体,再判断条件
    // 💡 至少会执行1次,即使条件不成立
    
    // break和continue: 循环控制
    for (int i = 0; i < 10; i++) {
        if (i == 5) continue;  // 💡 continue: 跳过本次循环,进入下一次
        if (i == 8) break;     // 💡 break: 直接退出整个循环
        printf("%d ", i);
    }
    // 💡 输出: 0 1 2 3 4 6 7 (跳过5,8之后停止)
    printf("\n");
    
    return 0;
}
```

**三种循环的选择:**

| 循环类型 | 适用场景 | 示例 |
|---------|---------|------|
| `for` | 知道循环次数 | 遍历数组、计数 |
| `while` | 不知道循环次数 | 读到文件末尾、等待条件 |
| `do-while` | 至少执行一次 | 菜单显示、输入验证 |

**实战案例: 求1到100的和**

```c
// 方法1: for循环
int sum = 0;
for (int i = 1; i <= 100; i++) {
    sum += i;  // 相当于 sum = sum + i
}
printf("sum = %d\n", sum);  // 输出: 5050

// 方法2: while循环
int sum = 0, i = 1;
while (i <= 100) {
    sum += i;
    i++;
}
printf("sum = %d\n", sum);
```

**新手常见错误❌**

```c
// ❌ 错误1: 死循环（条件永远成立）
for (int i = 0; i < 10; ) {  // 忘记写i++
    printf("%d ", i);  // 无限输出0
}

// ❌ 错误2: 差一错误（off-by-one error）
for (int i = 0; i <= 10; i++) {  // 用了<=而不是<
    // 会循环11次(0~10),而不是10次(0~9)
}

// ❌ 错误3: continue用在switch里
switch (x) {
    case 1:
        continue;  // ❌ 错误! switch里要用break,不是continue
}
```

---

### 1.4 数组

#### 一维数组

```c
#include <stdio.h>
#include <string.h>

int main() {
    // 声明和初始化
    int arr1[5] = {1, 2, 3, 4, 5};
    int arr2[5] = {1, 2};  // 剩余元素自动初始化为0
    int arr3[5] = {0};     // 全部初始化为0
    
    // 数组遍历
    for (int i = 0; i < 5; i++) {
        printf("%d ", arr1[i]);
    }
    printf("\n");
    
    // 数组作为参数传递（传递的是指针）
    void printArray(int arr[], int n);
    printArray(arr1, 5);
    
    return 0;
}

void printArray(int arr[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}
```

#### 二维数组

```c
#include <stdio.h>

int main() {
    // 二维数组声明
    int matrix[3][4] = {
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12}
    };
    
    // 遍历二维数组
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 4; j++) {
            printf("%3d ", matrix[i][j]);
        }
        printf("\n");
    }
    
    return 0;
}
```

---

### 1.5 函数

```c
#include <stdio.h>

// 函数声明
int add(int a, int b);
void swap(int *a, int *b);  // 指针参数
int max(int a, int b);

int main() {
    int x = 10, y = 20;
    
    // 函数调用
    int sum = add(x, y);
    printf("sum = %d\n", sum);
    
    // 传递指针修改变量
    swap(&x, &y);
    printf("x = %d, y = %d\n", x, y);
    
    return 0;
}

// 函数定义
int add(int a, int b) {
    return a + b;
}

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int max(int a, int b) {
    return (a > b) ? a : b;
}
```

#### 递归函数

```c
#include <stdio.h>

// 阶乘
int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

// 斐波那契数列
int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

// 最大公约数（欧几里得算法）
int gcd(int a, int b) {
    if (b == 0) return a;
    return gcd(b, a % b);
}

int main() {
    printf("5! = %d\n", factorial(5));
    printf("fib(10) = %d\n", fibonacci(10));
    printf("gcd(48, 18) = %d\n", gcd(48, 18));
    
    return 0;
}
```

---

### 1.6 指针

```c
#include <stdio.h>

int main() {
    int x = 10;
    int *p = &x;  // p指向x的地址
    
    printf("x的值: %d\n", x);
    printf("x的地址: %p\n", &x);
    printf("p的值（x的地址）: %p\n", p);
    printf("p指向的值: %d\n", *p);
    
    // 通过指针修改变量
    *p = 20;
    printf("修改后x的值: %d\n", x);
    
    // 数组和指针
    int arr[5] = {1, 2, 3, 4, 5};
    int *ptr = arr;  // arr本身就是指向第一个元素的指针
    
    for (int i = 0; i < 5; i++) {
        printf("%d ", *(ptr + i));  // 指针算术
    }
    printf("\n");
    
    return 0;
}
```

---

### 1.7 结构体

```c
#include <stdio.h>
#include <string.h>

// 定义结构体
struct Student {
    int id;
    char name[50];
    float score;
};

int main() {
    // 声明和初始化
    struct Student s1 = {1, "张三", 95.5};
    
    // 访问成员
    printf("学号: %d\n", s1.id);
    printf("姓名: %s\n", s1.name);
    printf("成绩: %.1f\n", s1.score);
    
    // 修改成员
    s1.score = 98.0;
    strcpy(s1.name, "李四");
    
    // 结构体指针
    struct Student *p = &s1;
    printf("通过指针访问: %d, %s, %.1f\n", 
           p->id, p->name, p->score);
    
    // 结构体数组
    struct Student students[3] = {
        {1, "张三", 95.5},
        {2, "李四", 88.0},
        {3, "王五", 92.3}
    };
    
    for (int i = 0; i < 3; i++) {
        printf("%d: %s - %.1f\n", 
               students[i].id, 
               students[i].name, 
               students[i].score);
    }
    
    return 0;
}
```

---

## 2️⃣ 从C到C++的转变

### 2.1 命名空间（namespace）

```cpp
#include <iostream>
using namespace std;

// 定义命名空间
namespace MySpace {
    int x = 10;
    void print() {
        cout << "MySpace::print()" << endl;
    }
}

int main() {
    // 使用using声明
    using namespace std;
    cout << "Hello C++" << endl;
    
    // 访问命名空间成员
    cout << MySpace::x << endl;
    MySpace::print();
    
    // 使用using声明单个成员
    using MySpace::x;
    cout << x << endl;
    
    return 0;
}
```

---

### 2.2 输入输出流

```cpp
#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    int a, b;
    
    // 输入
    cin >> a >> b;
    
    // 输出
    cout << "a = " << a << ", b = " << b << endl;
    
    // 格式化输出
    double pi = 3.14159265358979;
    cout << fixed << setprecision(2) << pi << endl;  // 3.14
    
    cout << setw(10) << 123 << endl;        // 右对齐，宽度10
    cout << left << setw(10) << 123 << endl; // 左对齐
    cout << setfill('0') << setw(5) << 123 << endl; // 00123
    
    return 0;
}
```

---

### 2.3 引用（Reference）

```cpp
#include <iostream>
using namespace std;

// 引用作为函数参数
void swap(int &a, int &b) {
    int temp = a;
    a = b;
    b = temp;
}

// 引用作为返回值
int& getElement(int arr[], int index) {
    return arr[index];
}

int main() {
    int x = 10, y = 20;
    
    // 引用：变量的别名
    int &ref = x;
    cout << "x = " << x << ", ref = " << ref << endl;
    
    ref = 30;  // 修改ref就是修改x
    cout << "x = " << x << endl;
    
    // 引用传递
    swap(x, y);
    cout << "交换后: x = " << x << ", y = " << y << endl;
    
    // 引用返回值可以作为左值
    int arr[5] = {1, 2, 3, 4, 5};
    getElement(arr, 2) = 100;
    cout << "arr[2] = " << arr[2] << endl;
    
    return 0;
}
```

**引用 vs 指针：**

| 特性 | 引用 | 指针 |
|------|------|------|
| 语法 | `int &ref = x` | `int *ptr = &x` |
| 初始化 | 必须初始化 | 可以不初始化 |
| 重新绑定 | 不能改变引用对象 | 可以指向其他对象 |
| 空值 | 不能为空 | 可以为NULL/nullptr |
| 使用 | 直接使用 | 需要解引用* |

---

### 2.4 函数重载

```cpp
#include <iostream>
using namespace std;

// 函数重载：同名函数，参数不同
int add(int a, int b) {
    return a + b;
}

double add(double a, double b) {
    return a + b;
}

int add(int a, int b, int c) {
    return a + b + c;
}

int main() {
    cout << add(1, 2) << endl;           // 调用int版本
    cout << add(1.5, 2.5) << endl;       // 调用double版本
    cout << add(1, 2, 3) << endl;        // 调用三参数版本
    
    return 0;
}
```

---

### 2.5 默认参数

```cpp
#include <iostream>
using namespace std;

// 默认参数必须从右向左设置
void print(int a, int b = 10, int c = 20) {
    cout << "a = " << a << ", b = " << b << ", c = " << c << endl;
}

int main() {
    print(1);           // a=1, b=10, c=20
    print(1, 2);        // a=1, b=2, c=20
    print(1, 2, 3);     // a=1, b=2, c=3
    
    return 0;
}
```

---

### 2.6 内联函数

```cpp
#include <iostream>
using namespace std;

// 内联函数：建议编译器将函数体嵌入到调用处
inline int max(int a, int b) {
    return (a > b) ? a : b;
}

inline int min(int a, int b) {
    return (a < b) ? a : b;
}

int main() {
    cout << max(10, 20) << endl;
    cout << min(10, 20) << endl;
    
    return 0;
}
```

**内联函数 vs 宏定义：**
- 内联函数有类型检查，更安全
- 内联函数可以调试
- 宏定义是简单的文本替换

---

### 2.7 新的类型转换

```cpp
#include <iostream>
using namespace std;

int main() {
    double d = 3.14;
    
    // static_cast：用于基本类型转换
    int i = static_cast<int>(d);
    
    // const_cast：去除const属性
    const int x = 10;
    int *p = const_cast<int*>(&x);
    
    // reinterpret_cast：指针类型转换
    long addr = reinterpret_cast<long>(p);
    
    cout << "i = " << i << endl;
    cout << "addr = " << addr << endl;
    
    return 0;
}
```

---

## 3️⃣ C++ STL标准模板库

### 3.1 vector（动态数组）

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    // 创建vector
    vector<int> v1;                    // 空vector
    vector<int> v2(5);                 // 5个0
    vector<int> v3(5, 10);             // 5个10
    vector<int> v4 = {1, 2, 3, 4, 5};  // 初始化列表
    
    // 添加元素
    v1.push_back(1);
    v1.push_back(2);
    v1.push_back(3);
    
    // 访问元素
    cout << "v1[0] = " << v1[0] << endl;
    cout << "v1.front() = " << v1.front() << endl;
    cout << "v1.back() = " << v1.back() << endl;
    
    // 大小和容量
    cout << "size: " << v1.size() << endl;
    cout << "capacity: " << v1.capacity() << endl;
    cout << "empty: " << v1.empty() << endl;
    
    // 遍历
    for (int i = 0; i < v1.size(); i++) {
        cout << v1[i] << " ";
    }
    cout << endl;
    
    // 范围for循环（C++11）
    for (int x : v1) {
        cout << x << " ";
    }
    cout << endl;
    
    // 迭代器遍历
    for (vector<int>::iterator it = v1.begin(); it != v1.end(); it++) {
        cout << *it << " ";
    }
    cout << endl;
    
    // 删除元素
    v1.pop_back();              // 删除最后一个
    v1.erase(v1.begin());       // 删除第一个
    v1.clear();                 // 清空
    
    // 常用操作
    vector<int> v = {3, 1, 4, 1, 5, 9, 2, 6};
    sort(v.begin(), v.end());              // 排序
    reverse(v.begin(), v.end());           // 反转
    
    // 查找
    auto it = find(v.begin(), v.end(), 5);
    if (it != v.end()) {
        cout << "找到5，位置: " << it - v.begin() << endl;
    }
    
    return 0;
}
```

**vector常用函数总结：**

| 函数 | 功能 | 时间复杂度 |
|------|------|-----------|
| `push_back(x)` | 尾部添加元素 | O(1)均摊 |
| `pop_back()` | 删除尾部元素 | O(1) |
| `size()` | 返回元素个数 | O(1) |
| `empty()` | 判断是否为空 | O(1) |
| `clear()` | 清空所有元素 | O(n) |
| `front()` | 返回第一个元素 | O(1) |
| `back()` | 返回最后一个元素 | O(1) |
| `insert(it, x)` | 在it处插入x | O(n) |
| `erase(it)` | 删除it处的元素 | O(n) |

---

### 3.2 string（字符串）

```cpp
#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

int main() {
    // 创建字符串
    string s1 = "Hello";
    string s2("World");
    string s3(5, 'A');  // "AAAAA"
    
    // 字符串拼接
    string s = s1 + " " + s2;
    cout << s << endl;
    
    // 访问字符
    cout << s[0] << endl;
    cout << s.front() << endl;
    cout << s.back() << endl;
    
    // 长度
    cout << "length: " << s.length() << endl;
    cout << "size: " << s.size() << endl;
    
    // 子串
    string sub = s.substr(0, 5);  // 从位置0开始，长度5
    cout << "substr: " << sub << endl;
    
    // 查找
    size_t pos = s.find("World");
    if (pos != string::npos) {
        cout << "找到World，位置: " << pos << endl;
    }
    
    // 替换
    s.replace(0, 5, "Hi");  // 替换[0, 5)为"Hi"
    cout << s << endl;
    
    // 插入和删除
    s.insert(2, "XXX");     // 在位置2插入
    s.erase(2, 3);          // 从位置2删除3个字符
    
    // 大小写转换
    string str = "Hello World";
    transform(str.begin(), str.end(), str.begin(), ::tolower);
    cout << str << endl;  // "hello world"
    
    transform(str.begin(), str.end(), str.begin(), ::toupper);
    cout << str << endl;  // "HELLO WORLD"
    
    // 字符串比较
    string a = "abc", b = "abd";
    cout << (a < b) << endl;  // 字典序比较
    
    // 字符串和数字转换
    int num = stoi("123");           // string to int
    double d = stod("3.14");         // string to double
    string numStr = to_string(456);  // int to string
    
    return 0;
}
```

---

### 3.3 stack（栈）

```cpp
#include <iostream>
#include <stack>
using namespace std;

int main() {
    stack<int> stk;
    
    // 入栈
    stk.push(1);
    stk.push(2);
    stk.push(3);
    
    // 栈顶元素
    cout << "top: " << stk.top() << endl;
    
    // 出栈
    stk.pop();
    cout << "top after pop: " << stk.top() << endl;
    
    // 大小和判空
    cout << "size: " << stk.size() << endl;
    cout << "empty: " << stk.empty() << endl;
    
    // 遍历（需要边遍历边弹出）
    while (!stk.empty()) {
        cout << stk.top() << " ";
        stk.pop();
    }
    cout << endl;
    
    return 0;
}
```

**应用：括号匹配**

```cpp
bool isValid(string s) {
    stack<char> stk;
    for (char c : s) {
        if (c == '(' || c == '[' || c == '{') {
            stk.push(c);
        } else {
            if (stk.empty()) return false;
            char top = stk.top();
            if ((c == ')' && top == '(') ||
                (c == ']' && top == '[') ||
                (c == '}' && top == '{')) {
                stk.pop();
            } else {
                return false;
            }
        }
    }
    return stk.empty();
}
```

---

### 3.4 queue（队列）

```cpp
#include <iostream>
#include <queue>
using namespace std;

int main() {
    queue<int> q;
    
    // 入队
    q.push(1);
    q.push(2);
    q.push(3);
    
    // 队首和队尾
    cout << "front: " << q.front() << endl;
    cout << "back: " << q.back() << endl;
    
    // 出队
    q.pop();
    cout << "front after pop: " << q.front() << endl;
    
    // 大小和判空
    cout << "size: " << q.size() << endl;
    cout << "empty: " << q.empty() << endl;
    
    // 遍历
    while (!q.empty()) {
        cout << q.front() << " ";
        q.pop();
    }
    cout << endl;
    
    return 0;
}
```

---

### 3.5 priority_queue（优先队列/堆）

```cpp
#include <iostream>
#include <queue>
#include <vector>
using namespace std;

int main() {
    // 默认是大根堆（最大元素在堆顶）
    priority_queue<int> maxHeap;
    
    maxHeap.push(3);
    maxHeap.push(1);
    maxHeap.push(4);
    maxHeap.push(1);
    maxHeap.push(5);
    
    while (!maxHeap.empty()) {
        cout << maxHeap.top() << " ";
        maxHeap.pop();
    }
    cout << endl;  // 输出: 5 4 3 1 1
    
    // 小根堆（最小元素在堆顶）
    priority_queue<int, vector<int>, greater<int>> minHeap;
    
    minHeap.push(3);
    minHeap.push(1);
    minHeap.push(4);
    minHeap.push(1);
    minHeap.push(5);
    
    while (!minHeap.empty()) {
        cout << minHeap.top() << " ";
        minHeap.pop();
    }
    cout << endl;  // 输出: 1 1 3 4 5
    
    return 0;
}
```

**自定义比较：**

```cpp
struct Node {
    int value;
    int priority;
    
    bool operator < (const Node &other) const {
        return priority < other.priority;  // 按优先级降序
    }
};

priority_queue<Node> pq;
```

---

### 3.6 set（集合）

```cpp
#include <iostream>
#include <set>
using namespace std;

int main() {
    // set：有序、不重复
    set<int> s;
    
    // 插入
    s.insert(3);
    s.insert(1);
    s.insert(4);
    s.insert(1);  // 重复元素不会插入
    s.insert(5);
    
    // 遍历（自动排序）
    for (int x : s) {
        cout << x << " ";
    }
    cout << endl;  // 输出: 1 3 4 5
    
    // 查找
    if (s.find(3) != s.end()) {
        cout << "找到3" << endl;
    }
    
    // 计数
    cout << "1的个数: " << s.count(1) << endl;  // 只能是0或1
    
    // 删除
    s.erase(3);     // 删除值为3的元素
    s.erase(s.begin());  // 删除迭代器指向的元素
    
    // 大小
    cout << "size: " << s.size() << endl;
    
    // lower_bound和upper_bound
    set<int> nums = {1, 3, 5, 7, 9};
    auto it1 = nums.lower_bound(5);  // 第一个>=5的元素
    auto it2 = nums.upper_bound(5);  // 第一个>5的元素
    
    cout << "lower_bound(5): " << *it1 << endl;  // 5
    cout << "upper_bound(5): " << *it2 << endl;  // 7
    
    return 0;
}
```

---

### 3.7 map（映射）

```cpp
#include <iostream>
#include <map>
#include <string>
using namespace std;

int main() {
    // map：键值对，按键自动排序
    map<string, int> mp;
    
    // 插入
    mp["apple"] = 3;
    mp["banana"] = 5;
    mp["orange"] = 2;
    mp.insert({"grape", 4});
    
    // 访问
    cout << "apple: " << mp["apple"] << endl;
    
    // 判断键是否存在
    if (mp.find("apple") != mp.end()) {
        cout << "找到apple" << endl;
    }
    
    if (mp.count("pear") == 0) {
        cout << "没有pear" << endl;
    }
    
    // 遍历
    for (auto &p : mp) {
        cout << p.first << ": " << p.second << endl;
    }
    
    // 或者
    for (auto it = mp.begin(); it != mp.end(); it++) {
        cout << it->first << ": " << it->second << endl;
    }
    
    // 删除
    mp.erase("banana");
    
    // 大小
    cout << "size: " << mp.size() << endl;
    
    return 0;
}
```

**统计字符出现次数：**

```cpp
string s = "hello world";
map<char, int> cnt;

for (char c : s) {
    cnt[c]++;
}

for (auto &p : cnt) {
    cout << p.first << ": " << p.second << endl;
}
```

---

### 3.8 unordered_set 和 unordered_map

```cpp
#include <iostream>
#include <unordered_set>
#include <unordered_map>
using namespace std;

int main() {
    // unordered_set：无序、不重复、O(1)查找
    unordered_set<int> us = {3, 1, 4, 1, 5};
    
    for (int x : us) {
        cout << x << " ";  // 顺序不确定
    }
    cout << endl;
    
    // unordered_map：无序键值对、O(1)查找
    unordered_map<string, int> um;
    um["apple"] = 3;
    um["banana"] = 5;
    
    for (auto &p : um) {
        cout << p.first << ": " << p.second << endl;
    }
    
    return 0;
}
```

**set/map vs unordered_set/unordered_map：**

| 特性 | set/map | unordered_set/unordered_map |
|------|---------|----------------------------|
| 底层实现 | 红黑树 | 哈希表 |
| 有序性 | 有序 | 无序 |
| 查找/插入/删除 | O(log n) | O(1)平均 |
| 遍历 | 按序 | 无序 |

---

### 3.9 pair（对组）

```cpp
#include <iostream>
#include <utility>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    // 创建pair
    pair<int, string> p1(1, "apple");
    pair<int, string> p2 = make_pair(2, "banana");
    auto p3 = make_pair(3, "orange");
    
    // 访问成员
    cout << p1.first << " " << p1.second << endl;
    
    // pair数组排序
    vector<pair<int, string>> vec = {
        {3, "c"},
        {1, "a"},
        {2, "b"}
    };
    
    sort(vec.begin(), vec.end());  // 按first排序
    
    for (auto &p : vec) {
        cout << p.first << " " << p.second << endl;
    }
    
    return 0;
}
```

---

### 3.10 algorithm（算法库）

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    vector<int> v = {3, 1, 4, 1, 5, 9, 2, 6};
    
    // 排序
    sort(v.begin(), v.end());              // 升序
    sort(v.begin(), v.end(), greater<int>()); // 降序
    
    // 反转
    reverse(v.begin(), v.end());
    
    // 查找
    auto it = find(v.begin(), v.end(), 5);
    if (it != v.end()) {
        cout << "找到5" << endl;
    }
    
    // 二分查找（需要先排序）
    sort(v.begin(), v.end());
    bool found = binary_search(v.begin(), v.end(), 5);
    
    // lower_bound: 第一个>=x的位置
    auto it1 = lower_bound(v.begin(), v.end(), 5);
    
    // upper_bound: 第一个>x的位置
    auto it2 = upper_bound(v.begin(), v.end(), 5);
    
    // 最大值和最小值
    int maxVal = *max_element(v.begin(), v.end());
    int minVal = *min_element(v.begin(), v.end());
    
    // 求和
    int sum = accumulate(v.begin(), v.end(), 0);
    
    // 去重（需要先排序）
    sort(v.begin(), v.end());
    v.erase(unique(v.begin(), v.end()), v.end());
    
    // 全排列
    vector<int> arr = {1, 2, 3};
    do {
        for (int x : arr) cout << x << " ";
        cout << endl;
    } while (next_permutation(arr.begin(), arr.end()));
    
    return 0;
}
```

---

## 4️⃣ 算法竞赛常用技巧

### 4.1 快速输入输出

```cpp
#include <iostream>
using namespace std;

int main() {
    // 关闭同步流，加速cin/cout
    ios::sync_with_stdio(false);
    cin.tie(0);
    cout.tie(0);
    
    int n;
    cin >> n;
    
    for (int i = 0; i < n; i++) {
        int x;
        cin >> x;
        cout << x << "\n";  // 用\n代替endl更快
    }
    
    return 0;
}
```

---

### 4.2 常用宏定义

```cpp
#include <bits/stdc++.h>
using namespace std;

// 类型简写
#define ll long long
#define ull unsigned long long
#define pii pair<int, int>
#define vi vector<int>
#define vll vector<long long>

// 循环简写
#define rep(i, a, b) for(int i = (a); i < (b); i++)
#define rrep(i, a, b) for(int i = (a); i >= (b); i--)

// 常用函数
#define all(x) (x).begin(), (x).end()
#define sz(x) (int)(x).size()
#define pb push_back
#define mp make_pair

// 常量
const int INF = 0x3f3f3f3f;
const ll LINF = 0x3f3f3f3f3f3f3f3fLL;
const int MOD = 1e9 + 7;

int main() {
    ll n;
    cin >> n;
    
    vi v(n);
    rep(i, 0, n) {
        cin >> v[i];
    }
    
    sort(all(v));
    
    return 0;
}
```

---

### 4.3 位运算技巧

```cpp
#include <iostream>
using namespace std;

int main() {
    int x = 10;  // 1010
    
    // 判断奇偶
    if (x & 1) cout << "奇数" << endl;
    else cout << "偶数" << endl;
    
    // 快速乘除2
    int a = x << 1;  // x * 2
    int b = x >> 1;  // x / 2
    
    // 交换两个数（不用临时变量）
    int p = 5, q = 7;
    p ^= q;
    q ^= p;
    p ^= q;
    cout << "p = " << p << ", q = " << q << endl;
    
    // 判断2的幂
    bool isPowerOf2 = (x > 0) && ((x & (x - 1)) == 0);
    
    // 获取最低位的1
    int lowbit = x & (-x);
    
    // 统计1的个数
    int cnt = __builtin_popcount(x);
    
    return 0;
}
```

---

### 4.4 常用数学函数

```cpp
#include <iostream>
#include <cmath>
#include <algorithm>
using namespace std;

int main() {
    // 绝对值
    cout << abs(-5) << endl;
    
    // 最大公约数（C++17）
    cout << __gcd(12, 8) << endl;
    
    // 幂运算
    cout << pow(2, 10) << endl;
    
    // 开方
    cout << sqrt(16) << endl;
    
    // 向上/向下取整
    cout << ceil(3.2) << endl;   // 4
    cout << floor(3.8) << endl;  // 3
    
    // 交换
    int a = 5, b = 7;
    swap(a, b);
    
    // 最大/最小值
    cout << max(3, 5) << endl;
    cout << min(3, 5) << endl;
    cout << max({1, 2, 3, 4, 5}) << endl;  // C++11
    
    return 0;
}
```

---

### 4.5 完整模板

```cpp
#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define pii pair<int, int>
#define vi vector<int>
#define rep(i, a, b) for(int i = (a); i < (b); i++)
#define all(x) (x).begin(), (x).end()

const int MAXN = 1e5 + 5;
const int INF = 0x3f3f3f3f;
const int MOD = 1e9 + 7;

int n, m;
int a[MAXN];

void solve() {
    // 在这里写解题代码
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0);
    
    int t = 1;
    // cin >> t;  // 多组测试数据时打开
    
    while (t--) {
        solve();
    }
    
    return 0;
}
```

---

## 📊 STL容器选择指南

| 需求 | 推荐容器 | 原因 |
|------|---------|------|
| 动态数组，频繁随机访问 | `vector` | O(1)随机访问 |
| 频繁首尾操作 | `deque` | O(1)首尾操作 |
| 需要LIFO | `stack` | 栈特性 |
| 需要FIFO | `queue` | 队列特性 |
| 需要优先级 | `priority_queue` | 堆结构 |
| 有序+去重+查找 | `set` | O(log n)操作 |
| 键值对+有序 | `map` | O(log n)操作 |
| 去重+快速查找 | `unordered_set` | O(1)平均查找 |
| 键值对+快速查找 | `unordered_map` | O(1)平均查找 |

---

## 💡 学习建议

1. **打好C语言基础**：指针、数组、结构体是重点
2. **理解C++特性**：引用、重载、命名空间
3. **熟练使用STL**：至少掌握vector、string、map、set
4. **多写代码**：理论+实践才能真正掌握
5. **刷题巩固**：LeetCode、洛谷、Codeforces
6. **阅读标准库文档**：cppreference.com
7. **参加比赛**：实战是最好的老师

---

## 📚 推荐资源

### 在线资源
- [cppreference](https://zh.cppreference.com/) - C++ STL文档
- [OI Wiki](https://oi-wiki.org/) - 算法竞赛知识库
- [LeetCode](https://leetcode.cn/) - 刷题平台
- [洛谷](https://www.luogu.com.cn/) - 国内算法竞赛平台

### 书籍推荐
- 《C++ Primer》- 全面系统
- 《STL源码剖析》- 深入理解STL
- 《算法竞赛入门经典》- 刘汝佳
- 《算法竞赛进阶指南》- 李煜东

---

## 🎯 练习题推荐

### 基础题
1. [洛谷 P1001] A+B Problem
2. [洛谷 P1009] 阶乘之和
3. [洛谷 P1014] Cantor表
4. [LeetCode 1] 两数之和
5. [LeetCode 20] 有效的括号

### 进阶题
1. [洛谷 P1sec] 排序
2. [LeetCode 15] 三数之和
3. [LeetCode 49] 字母异位词分组
4. [LeetCode 347] 前K个高频元素
5. [洛谷 P1sec] 普及组题目

---

> 💪 **加油！** C++是算法竞赛的利器，掌握好STL能让你的代码更简洁高效。多练习，多总结，祝你在算法竞赛中取得好成绩！

**Happy Coding! 🚀**

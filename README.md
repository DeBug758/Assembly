# About semestrovka.asm

It's just comparing of two strings

# About Square.asm
This code, with arbitrary values ​​of the radius of the circle and the side of the square, calculates the area of ​​​​the figure between the circle and the square.

## How does it works?

First we check which of the three main cases we fall under (when a circle is inside a square / when a circle intersects a square / when a square is inside a circle).

### First Case

![Screenshot_43](https://github.com/DeBug758/Assembly/assets/94057435/60f89d3d-b67e-4292-b1d1-7c06a8df424f)

In this situation whe just need to calculate S<sub>square</sub> and S<sub>circle</sub>. 
### Second Case

![Screenshot_44](https://github.com/DeBug758/Assembly/assets/94057435/8db4d0d4-3497-4e93-9853-8c0aba303493)

Most interesting case. We need to use formula S<sub>answ</sub> = S<sub>circle</sub> - 4(R^2 * sin(alph) / 2 - S<sub>circle</sub> * alph/360)

### Third Case

![Screenshot_45](https://github.com/DeBug758/Assembly/assets/94057435/aa3c6731-0267-4dfc-8a77-753a53921d13)

In this situation whe just need to calculate S<sub>square</sub> and S<sub>circle</sub>. 


**Other details in code.**

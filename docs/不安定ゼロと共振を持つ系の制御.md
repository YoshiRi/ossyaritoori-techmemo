---
title: 不安定ゼロと共振を持つ系の制御
date: 2019-08-29T15:51:13.800Z
dropCap: true
displayInMenu: false
displayInList: false
draft: false
---
二次系のプラントに極配置したが，PIDゲインが負になりやすい。
→ 帯域が180度回っている周波数での制御と考えるとゲインが負になるのはわかる。
→ また，ロバスト性が低い。これはどういうふうに議論できる？


CODE

```matlab
%% plant 

b1 = -29.95;
b0 = 100400;
a2 = 1; a1 = 2.171; a0 = 53070;
plant = tf([b1 b0],[a2 a1 a0]);
plant_ = tf([b1 b0],[a2*0.95 a1*0.95 a0*0.95]); %Real plant
%% poleplacement

freq = 5; % Hz
omega = freq*2*pi;

pole = [ 1; 4*omega; 6*omega*omega; 4*omega*omega*omega; omega*omega*omega*omega ]; % (s+omega)^4


Silvestar = [ 1 0 0 0 0;
            a1 1 b1 0 0;
            a0 a1 b0 b1 0;
            0 a0 0 b0 b1;
            0 0 0 0 b0 ];

cof = Silvestar\pole; % Silvestar*cof=pole


Tf = 1/cof(2);
Ki = cof(5)*Tf
Kp = (cof(4)-Ki)*Tf
Kd = (cof(3)-Kp)*Tf

%% check robustness
controller = tf([cof(3) cof(4) cof(5)],[cof(1),cof(2) 0])

% real plant 
closed_ = minreal((controller*plant_)/(1+controller*plant_))
step(closed_)
```

## 議論@8/30
- 制御は普通ノッチをかけて極ゼロ相殺した系に対してやるのが良いだろう
- 極配置はマスラインに到達する辺りの周波数に当てるべき


## 議論 with 延命
- 重根が悪いのでは：バタワースで配置してみる。ダメ。
- 速い極でうまくいくのはコントローラが無理やり位相を回復させて位相余裕をもたせているせいみたい。
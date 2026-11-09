# Qradiyent enişi və geri yayılma

> Quiz-1 · E hissəsi · [Mühazirə 2](../../01-lectures/02-neyron-sebekeler.md)

## 1. İntuisiya
Qatı dumanda dağdan enirsiniz və heç nə görmürsünüz. Yalnız ayağınızın altındakı **mailliyi** hiss edirsiniz. Hər dəfə ən dik **aşağı** istiqamətdə kiçik bir addım atırsınız. Bu addımları təkrarlayaraq dərənin dibinə, yəni itkinin minimumuna çatırsınız.

## 2. Düsturlar
$$w_{yeni} = w - \eta \cdot \frac{dL}{dw}$$

- $\frac{dL}{dw}$ mailliyi göstərir. Maillik müsbətdirsə, $w$ azalır. Mənfidirsə, $w$ **artır**.
- $\eta$ öyrənmə sürətidir, yəni addımın uzunluğu. Bu **hiperparametrdir**: onu model öyrənmir, biz seçirik.
- **Zəncir qaydası:** $\frac{dL}{dw} = \frac{dL}{d\hat y}\cdot\frac{d\hat y}{dz}\cdot\frac{dz}{dw}$. Geri yayılma bu qaydanı çıxışdan girişə doğru qat-qat tətbiq edir.

**Faydalı törəmələr:**
| Funksiya | Törəmə |
|---|---|
| $(w-a)^2$ | $2(w-a)$ |
| $\sigma(z)$ | $\sigma(z)(1-\sigma(z))$, ən böyük qiyməti $z=0$ nöqtəsində 0,25-dir |
| ReLU | $z>0$ olanda 1, $z<0$ olanda 0 |
| MSE $=\frac1n\sum(y-\hat y)^2$ | $\hat y$-ə görə: $-\frac2n\sum(y-\hat y)$ |

**Qradiyent niyə sönür?** Hər qatda qradiyent 1-dən kiçik bir ədədə vurulur. Məsələn, $0{,}9^{50} \approx 0{,}005$. Sigmoidin törəməsi ən çoxu 0,25 olduğu üçün dərin şəbəkələrdə qradiyent tez sönür. ReLU-nun və qalıq əlaqələrin (ResNet) faydası buradandır.

## 3. Əl ilə həll edilmiş misal
$L(w) = (w-3)^2$, $w=0$, $\eta=0{,}1$:

| Addım | $w$ | $dL/dw = 2(w-3)$ | $w_{yeni}$ |
|---|---|---|---|
| 1 | 0 | −6 | $0 - 0{,}1\cdot(-6) = $ **0,6** |
| 2 | 0,6 | −4,8 | $0{,}6 + 0{,}48 = $ **1,08** |
| 3 | 1,08 | −3,84 | **1,464** |

Maillik mənfi olduğu üçün $w$ artır və minimuma ($w=3$) yaxınlaşır. Addımlar getdikcə kiçilir, çünki maillik azalır.

**$\eta$ çox böyük olanda nə olur?**
- $\eta = 1$: $w$: 0 → 6 → 0 → 6 … sonsuz salınır və heç vaxt minimuma çatmır.
- $\eta = 1{,}1$: $w$: 0 → 6,6 → −1,32 → … **dağılır**, itki artır.

Bu, «böyük $\eta$ həmişə daha sürətli və daha yaxşıdır» təsdiqinin **yanlış** olduğunu göstərir.

## 4. Python ilə yoxlama
```python
w, eta = 0.0, 0.1
for step in range(5):
    grad = 2 * (w - 3)
    w = w - eta * grad
    print(step + 1, round(w, 4))   # 0.6, 1.08, 1.464, 1.7712, 2.017
```

## 5. AI-da harada istifadə olunur?
- Bütün neyron şəbəkələrin təlimi qradiyent enişinin variantları ilə aparılır: SGD, Momentum, Adam (2014).
- **Partiya (batch):** qradiyent bütün verilənlərlə yox, məsələn 32 nümunə ilə hesablanır. **Epoxa** bütün verilənlərdən bir dəfə keçməkdir.
- Xətti reqressiyada əlamət çox olanda matrisi tərs etmək əvəzinə qradiyent enişi işlədilir. Bu halda əlamətlərin miqyası vacib olur.

## 6. Tapşırıqlar
1. $w=5$, $\eta=0{,}1$, $dL/dw = 6$. Bir addımdan sonra $w$ nə olar?
2. $w=5$, $\eta=0{,}25$, $L=(w-3)^2$. Bir addımdan sonra $w$ nə olar?
3. $w=-2$, $\eta=0{,}5$, $dL/dw=-4$. Bir addımdan sonra $w$ nə olar və hansı istiqamətə hərəkət etdi?
4. Doğru, yoxsa yanlış: «Öyrənmə sürətini model özü öyrənir.»

<details><summary>Cavablar</summary>

1. $5 - 0{,}1\cdot6 = $ **4,4**
2. $dL/dw = 2(5-3) = 4$, $w = 5 - 0{,}25\cdot4 = $ **4**
3. $-2 - 0{,}5\cdot(-4) = -2 + 2 = $ **0**. Maillik mənfi olduğu üçün $w$ artdı.
4. **Yanlış.** $\eta$ hiperparametrdir və onu biz seçirik.

</details>

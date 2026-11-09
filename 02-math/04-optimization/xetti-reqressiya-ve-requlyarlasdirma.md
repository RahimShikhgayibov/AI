# Xətti reqressiya (ƏKK) və requlyarlaşdırma (Ridge, Lasso)

> Quiz-1 · E hissəsi · [Mühazirə 4](../../01-lectures/04-xetti-modeller.md)

## 1. İntuisiya
Nöqtələr arasından elə bir düz xətt keçirmək istəyirik ki, səhvlərin kvadratları cəmi **ən kiçik** olsun. Bu, optimallaşdırma məsələsidir. Model çox mürəkkəb olanda isə itkiyə bir **cərimə** əlavə edirik ki, əmsallar böyüməsin.

## 2. Düsturlar
- **Model:** $\hat y = w_0 + w_1 x$. **Qalıq:** $e = y - \hat y$.
- **ƏKK:** $\min_w \sum (y - \hat y)^2$. Həll **normal tənliklərdən** tapılır: $X^\top X w = X^\top y$.
- **Determinasiya əmsalı:** $R^2 = 1 - \dfrac{SSE}{SST}$, yəni modelin izah etdiyi dəyişkənliyin payı.

| | Məqsəd funksiyası | Həll |
|---|---|---|
| Ridge (L2) | $\lVert y-Xw\rVert^2 + \lambda \lVert w\rVert_2^2$ | $w^* = (X^\top X + \lambda I)^{-1} X^\top y$, $\lambda>0$ olanda matris həmişə tərs olunur |
| Lasso (L1) | $\tfrac12\lVert y-Xw\rVert^2 + \lambda \lVert w\rVert_1$ | düstur yoxdur, koordinat enişi və ya LARS işlədilir |

**Ortonormal əlamətlər olanda sadə formul** (ƏKK əmsalı $\hat w$):
- Ridge: $\dfrac{\hat w}{1+\lambda}$. Əmsal kiçilir, amma **heç vaxt sıfır olmur**.
- Lasso: $\text{sign}(\hat w)\cdot\max(|\hat w| - \lambda,\ 0)$. Buna «yumşaq hədd» deyilir: kiçik əmsallar **dəqiq sıfır** olur.

**Həndəsə:** Ridge məhdudiyyəti **dairədir**, Lasso məhdudiyyəti isə **rombdur**. Rombun küncləri oxların üstündədir və itkinin ellipsi çox vaxt məhz küncə toxunur. Ona görə Lasso-da bəzi əmsallar sıfır olur.

## 3. Əl ilə həll edilmiş misallar
**Misal 1:** $\hat y = 1{,}1 + 1{,}6x$
- $x = 2$: $\hat y = 1{,}1 + 3{,}2 = $ **4,3**
- real $y = 4$ olsa, qalıq $e = 4 - 4{,}3 = $ **−0,3**
- **meyl:** $x$ bir vahid artanda $\hat y$ 1,6 artır. Bu əlaqə göstərir, səbəb yox!

**Misal 2:** $\lambda = 1$ olanda ortonormal əlamətlər üçün:
| ƏKK $\hat w$ | Ridge | Lasso |
|---|---|---|
| 3 | 1,5 | 2 |
| 0,6 | 0,3 | **0** |
| −2 | −1 | −1 |

## 4. Python ilə yoxlama
```python
import numpy as np
X = np.array([[1, 1], [1, 2], [1, 3], [1, 4]])   # 1-lər sütunu w0 üçündür
y = np.array([2.5, 4.4, 5.6, 7.5])
w = np.linalg.solve(X.T @ X, X.T @ y)            # normal tənliklər
print(w)                                          # [w0, w1]

lam = 1.0
ridge = np.linalg.solve(X.T @ X + lam * np.eye(2), X.T @ y)
soft = lambda w, l: np.sign(w) * max(abs(w) - l, 0)
print(ridge, soft(3, 1), soft(0.6, 1))            # ..., 2.0, 0.0
```

## 5. AI-da harada istifadə olunur?
- Xətti reqressiya mürəkkəb modellər üçün **baza modeldir**. Kaggle 2020 sorğusunda mütəxəssislərin 59%-i onu işlədirdi.
- Neyron şəbəkələrdə L2 cəriməsinə **çəki azalması (weight decay)** deyilir.
- Lasso əlamət seçmək üçün işlədilir. Bayes baxışından Ridge Qauss aprioruna, Lasso isə Laplas aprioruna uyğundur.

## 6. Tapşırıqlar
1. $\hat y = 1{,}1 + 1{,}6x$, $x = 5$. Proqnoz nədir?
2. $\hat y = 1{,}1 + 1{,}6x$, $x = 3$, real $y = 5{,}5$. Qalıq nədir?
3. $SSE = 20$, $SST = 100$. $R^2$ nədir?
4. $\lambda = 1$, ƏKK əmsalı 0,8. Ridge və Lasso hansı əmsalı verir?
5. Doğru, yoxsa yanlış: «Ridge bəzi əmsalları dəqiq sıfıra endirir.»

<details><summary>Cavablar</summary>

1. $1{,}1 + 8 = $ **9,1**
2. $\hat y = 5{,}9$, $e = 5{,}5 - 5{,}9 = $ **−0,4**
3. $1 - 0{,}2 = $ **0,8**, yəni model dəyişkənliyin 80%-ni izah edir
4. Ridge $0{,}8/2 = $ **0,4**, Lasso $\max(0{,}8-1, 0) = $ **0**
5. **Yanlış.** Əmsalları sıfıra endirən Lasso-dur.

</details>

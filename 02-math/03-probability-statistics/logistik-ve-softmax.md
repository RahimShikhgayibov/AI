# Sigmoid, şans, logistik reqressiya və softmax

> Quiz-1 · E hissəsi · [Mühazirə 4](../../01-lectures/04-xetti-modeller.md)

## 1. İntuisiya
Xətti cəm $z$ istənilən ədəd ola bilər: −100 də, +100 də. Ehtimal isə yalnız 0 ilə 1 arasında olur. **Sigmoid** istənilən ədədi bu aralığa «sıxır». **Softmax** eyni işi K sinif üçün görür: bütün siniflərə müsbət ehtimallar paylayır və onların cəmi 1 olur.

## 2. Düsturlar
$$p = \sigma(z) = \frac{1}{1+e^{-z}}, \qquad z = w^\top x + b$$

| $z$ | −2 | 0 | 2 |
|---|---|---|---|
| $\sigma(z)$ | ≈ 0,12 | **0,5** | ≈ 0,88 |

- **Qərar:** $z > 0 \Leftrightarrow p > 0{,}5$, yəni sinif 1. Ona görə **sərhəd düz xəttdir**.
- **Şans (odds):** $\dfrac{p}{1-p}$. Tərsinə: $p = \dfrac{\text{şans}}{1+\text{şans}}$.
- **Log-şans xəttidir:** $\ln\dfrac{p}{1-p} = z$. Əlamət 1 vahid artanda şans $e^{w}$ dəfə dəyişir.
- **Çarpaz entropiya:** $L = -\ln p_{\text{doğru sinif}}$. $p=0{,}1$ olanda $L≈2{,}30$, $p=0{,}9$ olanda $L≈0{,}11$.

**Softmax** (K sinif):
$$p_k = \frac{e^{z_k}}{\sum_j e^{z_j}}$$
**Temperatur** $T$ ilə: $p_k = \dfrac{e^{z_k/T}}{\sum_j e^{z_j/T}}$. Kiçik T paylanmanı kəskinləşdirir, böyük T hamarlayır. Siniflərin sırası **dəyişmir**.

## 3. Əl ilə həll edilmiş misallar

**Misal 1 — logistik qərar:** $z = -4 + 0{,}5x$
- $x = 10$: $z = 1 > 0$, deməli $p > 0{,}5$, **sinif 1**
- $x = 8$: $z = 0$, deməli $p = 0{,}5$, nöqtə **tam sərhəddədir**
- $x = 6$: $z = -1 < 0$, **sinif 0**

**Misal 2 — şans:**
| $p$ | 0,2 | 0,5 | 0,75 | 0,8 |
|---|---|---|---|---|
| şans | 0,25 | 1 | 3 | **4** («4-ə 1») |

⚠️ **TƏLƏ:** şans 2 dəfə artarsa, ehtimal 2 dəfə artmır! Məsələn, $p=0{,}8$ olanda şans 4-dür. Şansı 8-ə qaldırsaq, $p = 8/9 \approx 0{,}89$ olur, 1,6 yox.

**Misal 3 — softmax:** loqitlər 2, 1, 0,1 (pişik, it, quş)
- $e^2 \approx 7{,}39$, $e^1 \approx 2{,}72$, $e^{0{,}1} \approx 1{,}11$, cəmi ≈ 11,21
- ehtimallar ≈ **0,66 · 0,24 · 0,10**, cəmi = 1 ✓

**Misal 4 — temperatur** (iki sinif, loqitlər 2 və 0):
| T | 0,5 | 1 | 2 |
|---|---|---|---|
| p(birinci sinif) | ≈ 0,98 | ≈ 0,88 | ≈ 0,73 |

**Misal 5 — İris:** 3 sinif, 4 əlamət. Hər sinfin 4 çəkisi və 1 sürüşməsi var: $3\cdot(4+1) = $ **15** parametr.

## 4. Python ilə yoxlama
```python
import numpy as np
sigmoid = lambda z: 1 / (1 + np.exp(-z))
print(sigmoid(np.array([-2, 0, 2])))        # [0.119 0.5 0.881]

def softmax(z, T=1.0):
    e = np.exp(np.array(z) / T)
    return e / e.sum()
print(softmax([2, 1, 0.1]).round(2))        # [0.66 0.24 0.1]
print(softmax([2, 0], T=0.5).round(2))      # [0.98 0.02]
```

## 5. AI-da harada istifadə olunur?
- **Hər böyük dil modelinin son qatı softmax-dır.** Siniflər lüğətdəki tokenlərdir. ChatGPT-dəki «temperature» parametri məhz bu temperaturdur.
- Logistik reqressiya izah olunduğu üçün bank kredit bal kartlarında, futbolda xG modelində və Elo reytinqində işlədilir.
- Sigmoid neyronlarda aktivasiya funksiyası kimi də istifadə olunur.

## 6. Tapşırıqlar
1. $z = -4 + 0{,}5x$, $x = 6$. $z$ nədir və sinif hansıdır?
2. $z = 1 - 2x$. $x = 0$ və $x = 1$ üçün sinif hansıdır? Sərhəd hansı $x$-dədir?
3. $p = 0{,}9$ olanda şans nədir?
4. Şans 3-dür. $p$ nədir?
5. Doğru, yoxsa yanlış: «Logistik reqressiya ədəd proqnozlaşdıran reqressiya modelidir.»
6. Loqitlər 5, 5, 5-dir. Softmax ehtimalları nədir?

<details><summary>Cavablar</summary>

1. $z = -4 + 3 = -1 < 0$, **sinif 0**
2. $x=0$: $z = 1 > 0$, **sinif 1**. $x=1$: $z = -1$, **sinif 0**. Sərhəd: $1 - 2x = 0$, yəni $x = $ **0,5**
3. $0{,}9/0{,}1 = $ **9**
4. $3/(1+3) = $ **0,75**
5. **Yanlış.** Logistik reqressiya təsnifat modelidir.
6. Hər biri **1/3**. Loqitlər bərabər olduqda ehtimallar da bərabər olur.

</details>

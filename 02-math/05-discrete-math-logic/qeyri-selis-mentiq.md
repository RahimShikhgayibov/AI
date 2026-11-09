# Qeyri-səlis məntiq: üzvlük funksiyası və Zadənin əməliyyatları

> Quiz-1 · E hissəsi · [Mühazirə 5](../../01-lectures/05-ehtimal-modelleri.md) · Lütfi Zadə, 1965 (Bakıda doğulub 🇦🇿)

## 1. İntuisiya
Adi məntiqdə hava ya istidir, ya da isti deyil. Əgər «isti» 30 °C-dən başlayırsa, 29,9 °C isti sayılmır, 30,1 °C isə isti sayılır. İnsan belə danışmır. Qeyri-səlis məntiqdə hər element çoxluğa **0 ilə 1 arasında bir dərəcə** ilə aid olur.

## 2. Düsturlar
**Xətti artan üzvlük funksiyası** («isti» $a$ dərəcədən $b$ dərəcəyə qədər artır):
$$\mu(T) = \begin{cases} 0, & T \le a \\ \dfrac{T-a}{b-a}, & a < T < b \\ 1, & T \ge b \end{cases}$$

**Zadənin əməliyyatları:**
| Əməliyyat | Düstur |
|---|---|
| VƏ | $\min(\mu_A, \mu_B)$ |
| VƏ YA | $\max(\mu_A, \mu_B)$ |
| DEYİL | $1 - \mu_A$ |

Qiymətlər yalnız 0 və 1 olanda bu əməliyyatlar adi Bul məntiqi ilə üst-üstə düşür.

## 3. Əl ilə həll edilmiş misallar
**Misal 1:** «isti» 24 °C-dən 32 °C-yə qədər artır.
- $\mu(29) = (29-24)/8 = 5/8 = $ **0,625**
- $\mu(26) = 2/8 = $ **0,25**
- $\mu(35) = $ **1**, $\mu(20) = $ **0**

**Misal 2:** $\mu_{isti} = 0{,}6$, $\mu_{rütubətli} = 0{,}7$
- isti VƏ rütubətli: $\min = $ **0,6**
- isti VƏ YA rütubətli: $\max = $ **0,7**
- isti DEYİL: $1 - 0{,}6 = $ **0,4**

## ⚠️ Dərəcə ehtimal deyil!
| Ehtimal | Qeyri-səlislik |
|---|---|
| «Sabah yağış yağacaqmı?» Hadisə ya olacaq, ya da olmayacaq, biz sadəcə bilmirik | «Bu gün hava istidir?» Hər şey məlumdur (29 °C), qeyri-müəyyən olan sözün özüdür |
| ehtimalların cəmi 1 olmalıdır | dərəcələrin cəmi 1 olmaq məcburiyyətində deyil |
| 0,4 «40% ehtimalla» deməkdir | 0,4 «**bir az** isti» deməkdir |

## 4. Python ilə yoxlama
```python
def mu_hot(T, a=24, b=32):
    return min(1, max(0, (T - a) / (b - a)))

print(mu_hot(29), mu_hot(26), mu_hot(35))   # 0.625 0.25 1
AND, OR, NOT = min, max, (lambda m: 1 - m)
print(AND(0.6, 0.7), OR(0.6, 0.7), NOT(0.6))  # 0.6 0.7 0.4
```

## 5. AI-da harada istifadə olunur?
- **Mamdani (1975):** sözlə yazılmış qaydalarla buxar maşınını idarə etdi.
- **Sendai metrosu (1987, Hitachi):** qatarı qeyri-səlis qaydalar idarə edirdi və ~10% enerji qənaəti əldə olundu.
- Paltaryuyan maşınlar, kondisionerlər, kameraların avtofokusu da bu prinsiplə işləyir.

## 6. Tapşırıqlar
1. $\mu_{soyuq} = 0{,}3$, $\mu_{küləkli} = 0{,}8$. VƏ, VƏ YA və «soyuq DEYİL» nədir?
2. $\mu_A = 0{,}45$, $\mu_B = 0{,}9$. VƏ, VƏ YA və DEYİL A nədir?
3. «İsti» 24 °C-dən 32 °C-yə qədər artır. $\mu(30)$ nədir?
4. Doğru, yoxsa yanlış: «Üzvlük dərəcəsi ehtimaldır.»

<details><summary>Cavablar</summary>

1. VƏ **0,3**, VƏ YA **0,8**, soyuq DEYİL **0,7**
2. VƏ **0,45**, VƏ YA **0,9**, DEYİL A **0,55**
3. $(30-24)/8 = $ **0,75**
4. **Yanlış.** Dərəcə sözün qeyri-səlisliyini ifadə edir, bilik çatışmazlığını yox.

</details>

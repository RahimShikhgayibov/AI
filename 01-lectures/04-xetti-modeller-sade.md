# 📕 Mühazirə 4: Xətti modellər (Linear Models), sadə dildə izah

> Bu, [qısa konspektin](04-xetti-modeller.md) geniş və sadə versiyasıdır. Sıfırdan başlayanlar üçün yazılıb.
> Riyaziyyat: [ƏKK və requlyarlaşdırma](../02-math/04-optimization/xetti-reqressiya-ve-requlyarlasdirma.md) · [logistik və softmax](../02-math/03-probability-statistics/logistik-ve-softmax.md)

---

## 0️⃣ Ümumi mənzərə: modelə verilən iki sual

| Sual | Cavab nədir? | Adı | Nümunə |
|---|---|---|---|
| **«Nə qədər?»** | ədəd | **reqressiya (regression)** | mənzil neçəyə satılar? |
| **«Hansı?»** | sinif | **təsnifat (classification)** | məktub spamdır, yoxsa yox? |

Bu mühazirədə hər iki sualı **eyni sadə ideya** ilə həll edən modelləri öyrənirik: **çəkili cəm (weighted sum)**. Bu, Mühazirə 2-dəki neyron düsturunun eynisidir.

---

## 1️⃣ Xətti reqressiya (Linear Regression): düz xətt çəkmək 📈

### Gündəlik həyatdan misal: taksi
Taksiyə minən kimi **1 manat** yazılır, hər km üçün də **0,5 manat** əlavə olunur:
```
qiymət = 1 + 0,5 × km        → 10 km: 1 + 0,5 × 10 = 6 manat
```
**Bu, xətti reqressiyadır!** Ümumi forma belədir:
```
ŷ = w₀ + w₁ · x
```
| Simvol | Mənası | Taksidə | English |
|---|---|---|---|
| **x** | giriş | km | input / feature |
| **ŷ** («y-şapka») | modelin proqnozu | qiymət | prediction |
| **w₀** | başlanğıc qiymət | 1 manat | **intercept** (sərbəst hədd) |
| **w₁** | x 1 vahid artanda ŷ nə qədər artır | 0,5 manat | **coefficient / slope** (əmsal, meyl) |

Taksidə w₀ və w₁ ədədlərini bilirik. Maşın öyrənməsində isə **bilmirik**: əlimizdə yalnız keçmiş verilənlər var. Model bu nöqtələrdən **ən uyğun xətti** özü tapır.

### Qalıq (residual): modelin səhvi
```
qalıq = real − proqnoz        e = y − ŷ
```
🧮 Model `ŷ = 1,1 + 1,6·x`, giriş `x = 2`:
1. Proqnoz: `ŷ = 1,1 + 3,2 = 4,3`
2. Real qiymət `y = 4` olubsa, qalıq: `e = 4 − 4,3 = −0,3`. Mənfi qalıq o deməkdir ki, model **çox** proqnoz verib.

### Ən yaxşı xətt: ƏKK (Ordinary Least Squares, OLS)
**Qayda:** elə bir xətt seç ki, **bütün qalıqların kvadratları cəmi ən kiçik** olsun.

**Niyə məhz kvadrat?**
1. Qalıqlar +3 və −3 ola bilər və sadə cəmdə bir-birini silərlər. Kvadratda isə ikisi də müsbət olur: 9 + 9.
2. Böyük səhv daha çox cərimələnir: 1² = 1, amma 10² = 100.
3. Həll düsturla tapılır. Bu düstura **normal tənliklər (normal equations)** deyilir.

**R² (coefficient of determination):** model dəyişkənliyin neçə faizini izah edir? Qiyməti 0 ilə 1 arasındadır. `R² = 0,985` olsa, model 98,5%-i izah edir.

### Tarix 📜
- **1801:** Piatsi Ceres adlı səma cismini gördü, sonra onu itirdi. 24 yaşlı **Qauss** orbiti hesabladı və Ceres tapıldı.
- **Lejandr (Legendre), 1805:** ƏKK üsulunu ilk dəfə dərc etdi. **Qauss (Gauss), 1809:** üsulu əsaslandırdı.
- **Qalton (Galton), 1886:** «reqressiya» sözünü işlətdi. Uca valideynlərin övladları da uca olur, amma ortaya daha yaxın olur. Buna **ortaya reqressiya (regression to the mean)** deyilir.

### ⚠️ Əmsal SƏBƏBİ göstərmir!
Yayda həm dondurma satışı artır, həm də boğulma halları. Bu ikisi arasında əlaqə var, amma dondurma boğulmanın səbəbi deyil. İkisinin də səbəbi isti havadır.
> **Əmsal əlaqəni göstərir, səbəbi yox.** (correlation ≠ causation)

**Anskomb kvarteti (Anscombe's quartet), 1973:** 4 fərqli verilən dəstinin statistikaları eynidir, amma qrafikləri tamam fərqlidir. Dərs: **əvvəlcə qrafikə bax.**

---

## 2️⃣ «Xətti» nə deməkdir? 🌀

**«Xətti» sözü w-ya aiddir, x-ə yox.** Məsələn, bu model:
```
y = w₀ + w₁ · x²
```
əyri çəkir, amma **yenə xətti modeldir**. Çünki w-lar adi şəkildə vurulub toplanır.

### Polinomun dərəcəsi: çox sadə ↔ çox mürəkkəb
| Dərəcə | Nə baş verir | Termin |
|---|---|---|
| 1 | çox sadədir, nöqtələri tuta bilmir | **underfitting** |
| 3 | əsas formanı tutur ✅ | balans |
| 11 | 12 nöqtənin hamısından keçir, aralarda isə dəli kimi əyilir | **overfitting** |

Overfitting-in əlaməti **nəhəng əmsallardır**. Model cavabları əzbərləyən tələbə kimi küyü əzbərləyib.

**Multikollinearlıq (multicollinearity):** iki əlamət eyni şeyi ölçəndə, məsələn boy həm sm, həm də düym ilə veriləndə, əmsallar qeyri-sabit olur. Həll: birini çıxarmaq və ya Ridge işlətmək.

---

## 3️⃣ Requlyarlaşdırma (Regularization): mürəkkəbliyə görə cərimə 🛡️

Modelə belə deyirik: «Səhvini kiçilt, **amma** böyük əmsallara görə cərimə ödəyəcəksən.»
```
yeni itki = səhv + λ × cərimə
```
**λ (lambda)** cərimənin gücünü təyin edir. λ = 0 olanda cərimə yoxdur. λ böyüdükcə əmsallar daha çox kiçilir. λ çarpaz yoxlama (cross-validation) ilə seçilir.

| | **Ridge (L2)** | **Lasso (L1)** |
|---|---|---|
| Nə edir | əmsalları **kiçildir**, amma **sıfır etmir** | bəzi əmsalları **dəqiq sıfıra** endirir |
| Faydası | multikollinearlığı həll edir | **əlamət seçir (feature selection)** |
| Düsturla həll | ✅ var | ❌ yoxdur |
| Həndəsi forma | dairə ⭕ | romb 🔷 |
| Kim | Hörl və Kennard, 1970 | **Tibşirani (Tibshirani), 1996** |

🧠 **Yadda saxlamaq üçün:** **L**asso əmsalları **L**əğv edir.

**Niyə Lasso sıfır verir?** Rombun iti küncləri oxların üstündədir və həll çox vaxt küncə düşür. Küncdə isə əmsallardan biri 0 olur. Dairənin küncü yoxdur.

**Elastic Net (2005)** ikisini birləşdirir. Neyron şəbəkələrdə L2 cəriməsinə **weight decay** deyilir.

---

## 4️⃣ Logistik reqressiya (Logistic Regression): «hə» və ya «yox» 🔀

### ⚠️ Adına aldanma: bu, TƏSNİFAT modelidir! (David Cox, 1958)

**Problem:** ehtimal 0 ilə 1 arasında olmalıdır, amma adi xətt 1,76 və ya −0,34 kimi cavablar verə bilər.

**Həll:** əvvəlcə çəkili cəmi hesablayırıq, sonra onu **sigmoiddən** keçiririk:
```
z = w₀ + w₁ · x
p = 1 / (1 + e^(−z))
```
| z | −2 | **0** | 2 |
|---|---|---|---|
| p | ≈ 0,12 | **0,5** | ≈ 0,88 |

### 🎯 Ən vacib qayda
```
z > 0  →  p > 0,5  →  sinif 1
z < 0  →  p < 0,5  →  sinif 0
z = 0  →  p = 0,5  →  tam sərhəd (decision boundary)
```
Sigmoidi hesablamağa ehtiyac yoxdur, **yalnız z-in işarəsinə bax.**

🧮 `z = −4 + 0,5·x`, `x = 10` → `z = −4 + 5 = 1 > 0` → **sinif 1**

**0,5 həddi məcburi deyil.** Xəstəni buraxmaq təhlükəlidirsə, həddi aşağı salırıq (Mühazirə 5).

### Şans (odds)
«4-ə 1 şans» ifadəsi elə budur:
```
şans = p / (1 − p)        p = 0,8  →  0,8 / 0,2 = 4
```
⚠️ **Şans 2 dəfə artarsa, ehtimal 2 dəfə artmır!** p = 0,8 olanda şans 4-dür. Şans 8 olsa, `p = 8/9 ≈ 0,89` alınır, 1,6 yox.

**İtki funksiyası:** çarpaz entropiya (cross-entropy / log-loss). **Harada işlədilir?** Futbolda xG, şahmatda Elo reytinqi, bank kreditləri. Bank qərarını izah etməlidir, logistik model də asan izah olunur.

---

## 5️⃣ Softmax: 2-dən çox sinif olanda 🎲
Model hər sinfə bir «xal» verir, buna **logit** deyilir. Softmax bu xalları ehtimallara çevirir:

| Sinif | Logit | Ehtimal |
|---|---|---|
| pişik 🐱 | 2 | **0,66** |
| it 🐶 | 1 | **0,24** |
| quş 🐦 | 0,1 | **0,10** |
| | | **cəmi = 1** ✅ |

1. Ehtimalların cəmi **həmişə 1-dir**.
2. 2 sinif olanda softmax **sigmoidə** çevrilir.
3. **Hər LLM-in son qatı softmax-dır.** ChatGPT növbəti tokeni belə seçir.
4. **Temperatur (temperature):** kiçik T ilə model daha əmin olur (kod üçün), böyük T ilə daha «yaradıcı» olur (şeir üçün). Siniflərin **sırası dəyişmir**.

**İris (Fisher, 1936):** 3 növ, 4 ölçü. Parametrlərin sayı `3 × (4 + 1) = 15`, dəqiqlik 97,3%.

---

## 6️⃣ GLM: hər növ cavab üçün öz modeli (Generalized Linear Models)
| Cavab nədir? | Model | Nümunə |
|---|---|---|
| istənilən ədəd | xətti reqressiya | mənzilin qiyməti |
| 0 və ya 1 | logistik reqressiya | kredit qaytarılacaqmı? |
| K sinif | softmax reqressiya | növbəti token |
| **say**: 0, 1, 2… | **Puasson reqressiyası (Poisson regression)** | zənglər, qollar |
| **müsbət məbləğ** | **Qamma reqressiyası (Gamma regression)** | sığorta ödənişi |

Puasson reqressiyasının proqnozu heç vaxt mənfi olmur. GLM-i Nelder və Wedderburn 1972-də formalaşdırıb.

---

## 7️⃣ ⚠️ Tələlər
| İddia | Cavab |
|---|---|
| Logistik reqressiya ədəd proqnozlaşdırır | **Y**: təsnifat modelidir |
| Ridge bəzi əmsalları sıfıra endirir | **Y**: bunu Lasso edir |
| `y = w₀ + w₁·x²` xətti model deyil | **Y**: w-ya görə xəttidir |
| Şans 2 dəfə artarsa, ehtimal da 2 dəfə artar | **Y** |
| Əmsal əlaqəni göstərir, səbəbi yox | **D** |
| Softmax ehtimallarının cəmi 1-dir | **D** |

---

## ✍️ Özünü yoxla
1. Logistik reqressiya reqressiya modelidir, yoxsa təsnifat modeli?
2. Hansı üsul əmsalları dəqiq sıfıra endirir?
3. D/Y: «`y = w₀ + w₁·x²` xətti model deyil.»
4. `ŷ = 1,1 + 1,6·x`, `x = 5`. Proqnoz nədir?
5. `z = −4 + 0,5·x`, `x = 6`. z nədir və sinif hansıdır?
6. `p = 0,75`. Şans nədir?
7. Bir saatda gələn zənglərin sayı üçün hansı model uyğundur?
8. D/Y: «Reqressiyada əmsal səbəbi göstərir.»

<details><summary>Cavablar</summary>

1 təsnifat · 2 Lasso · 3 Y · 4 `1,1 + 8 = 9,1` · 5 `z = −1`, sinif 0 · 6 `0,75 / 0,25 = 3` · 7 Puasson reqressiyası · 8 Y

</details>

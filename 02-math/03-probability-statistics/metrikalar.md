# Təsnifat metrikaları: qarışıqlıq matrisi, dəqiqlik, tamlıq, F1

> Quiz-1 · E hissəsi · [Mühazirə 1](../../01-lectures/01-si-giris.md)

## 1. İntuisiya
«Model 99% düzgündür» cümləsi tək başına heç nə demir. Fırıldaq halları cəmi 1%-dirsə, hamısına «normal» deyən **tənbəl model** də 99% alır, amma bir dənə də fırıldağı tapmır. Ona görə müsbət sinfə ayrıca baxan metrikalar lazımdır.

## 2. Düsturlar

| | Proqnoz: **+** | Proqnoz: **−** |
|---|---|---|
| **Real: +** | TP (doğru müsbət) | FN (yalan mənfi: xəstəni sağlam saymaq) |
| **Real: −** | FP (yalan müsbət: sağlamı xəstə saymaq) | TN (doğru mənfi) |

| Metrika | Düstur | Sual |
|---|---|---|
| Düzgünlük (accuracy) | $\dfrac{TP+TN}{\text{hamısı}}$ | Ümumilikdə nə qədər düz tapdıq? |
| **Dəqiqlik** (precision) | $\dfrac{TP}{TP+FP}$ | «Müsbət» dediklərimizin neçəsi həqiqətən müsbətdir? |
| **Tamlıq** (recall) | $\dfrac{TP}{TP+FN}$ | Real müsbətlərin neçəsini tapdıq? |
| F1 | $\dfrac{2PR}{P+R}$ | Dəqiqlik və tamlığın harmonik ortası |

**Yadda saxlamaq üçün:** dəqiqliyin məxrəcində **FP**, tamlığın məxrəcində **FN** var. Dəqiqlik **proqnoz** sütununa, tamlıq **real** sətrə baxır.

## 3. Əl ilə həll edilmiş misal
100 müraciət: TP = 8, FN = 2, FP = 4, TN = 86
- düzgünlük $(8+86)/100 = $ **0,94**
- dəqiqlik $8/12 \approx$ **0,67**
- tamlıq $8/10 = $ **0,8**
- F1 $= \dfrac{2\cdot\frac23\cdot\frac45}{\frac23+\frac45} = \dfrac{16/15}{22/15} = \dfrac{8}{11} \approx$ **0,73**

**Tənbəl model:** 1000 əməliyyatdan 10-u fırıldaqdır və model hamısına «normal» deyir. Onda TP = 0, FN = 10, FP = 0, TN = 990.
Düzgünlük $990/1000 = $ **99%**, tamlıq $0/10 = $ **0**. Model heç bir fırıldağı tapmır.

## 4. Python ilə yoxlama
```python
def metrics(tp, fn, fp, tn):
    acc = (tp + tn) / (tp + fn + fp + tn)
    p = tp / (tp + fp) if tp + fp else 0
    r = tp / (tp + fn)
    f1 = 2 * p * r / (p + r) if p + r else 0
    return round(acc, 3), round(p, 3), round(r, 3), round(f1, 3)

print(metrics(8, 2, 4, 86))     # (0.94, 0.667, 0.8, 0.727)
print(metrics(0, 10, 0, 990))   # (0.99, 0, 0.0, 0)
```

## 5. AI-da harada istifadə olunur?
- **Tibb və fırıldaq:** burada tamlıq vacibdir, çünki xəstəni və ya fırıldağı buraxmaq bahadır.
- **Spam süzgəci:** burada dəqiqlik vacibdir, çünki vacib məktubu spama atmaq bahadır.
- Metrikanı seçmək Bayes mühazirəsindəki eşik seçimi ilə birbaşa bağlıdır. Ətraflı: [bayes-ve-qerar.md](bayes-ve-qerar.md).

## 6. Tapşırıqlar
1. 200 nümunə: TP = 30, FP = 10, FN = 20, TN = 140. Düzgünlük, dəqiqlik, tamlıq və F1 nədir?
2. Model 50 nümunəyə «müsbət» deyib və onların 40-ı həqiqətən müsbətdir. Bütün real müsbətlərin sayı 80-dir. Dəqiqlik və tamlıq nədir?
3. Doğru, yoxsa yanlış: «99% düzgünlük həmişə yaxşı model deməkdir.»

<details><summary>Cavablar</summary>

1. Düzgünlük $170/200 = $ **0,85**, dəqiqlik $30/40 = $ **0,75**, tamlıq $30/50 = $ **0,6**, F1 $= 0{,}9/1{,}35 \approx$ **0,67**
2. Dəqiqlik $40/50 = $ **0,8**, tamlıq $40/80 = $ **0,5**
3. **Yanlış.** Siniflər balanssızdırsa, tənbəl model də 99% ala bilər.

</details>

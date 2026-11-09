# 🧮 AI üçün Riyaziyyat

AI-ı həqiqətən başa düşmək üçün riyaziyyat əsasdır. Bu qovluqda hər sahə ayrıca öyrənilir
və **hər mövzunun AI-da harada istifadə olunduğu** göstərilir.

## Xəritə

| Sahə | Əsas suallar | AI-da harada? |
|---|---|---|
| [01 — Xətti cəbr](01-linear-algebra/) | Vektor, matris, məxsusi qiymət | Neyron şəbəkələr, embedding-lər, PCA |
| [02 — Analiz (Calculus)](02-calculus/) | Törəmə, qradiyent, zəncir qaydası | Backpropagation, öyrənmə prosesi |
| [03 — Ehtimal və statistika](03-probability-statistics/) | Bayes, paylanmalar, gözləmə | Naive Bayes, qeyri-müəyyənlik, generativ modellər |
| [04 — Optimallaşdırma](04-optimization/) | Minimum tapmaq, qabarıqlıq | Gradient descent, itki funksiyaları |
| [05 — Diskret riyaziyyat və məntiq](05-discrete-math-logic/) | Qraflar, məntiq, kombinatorika | Axtarış alqoritmləri, bilik təsviri |
| [06 — İnformasiya nəzəriyyəsi](06-information-theory/) | Entropiya, KL divergensiya | Qərar ağacları, cross-entropy itkisi |

## 🎯 Quiz 1 riyaziyyatı (E hissəsi)

| Fayl | Nə var? |
|---|---|
| [Neyronun cəbri](01-linear-algebra/neyronun-cebri.md) | çəkili cəm, parametrlərin sayı, konvolyusiyanın çıxışı, XOR |
| [Qradiyent enişi](02-calculus/qradiyent-enisi.md) | $w - \eta\, dL/dw$, zəncir qaydası, böyük $\eta$ ilə dağılma |
| [Bayes və qərar](03-probability-statistics/bayes-ve-qerar.md) | 1000 nəfər üsulu, eşik, MLE, Laplas |
| [Metrikalar](03-probability-statistics/metrikalar.md) | TP, FP, FN, TN, dəqiqlik, tamlıq, F1 |
| [Logistik və softmax](03-probability-statistics/logistik-ve-softmax.md) | sigmoid, şans, softmax, temperatur |
| [Xətti reqressiya və requlyarlaşdırma](04-optimization/xetti-reqressiya-ve-requlyarlasdirma.md) | ƏKK, $R^2$, Ridge, Lasso |
| [Qeyri-səlis məntiq](05-discrete-math-logic/qeyri-selis-mentiq.md) | üzvlük funksiyası, min, max, $1-\mu$ |

## Hər mövzu faylının quruluşu

Şablon: [`templates/math-topic-template.md`](../templates/math-topic-template.md)

1. **İntuisiya** — sadə dillə nədir?
2. **Tərif və düsturlar** — LaTeX ilə
3. **Əl ilə həll edilmiş misal**
4. **Python ilə yoxlama** (numpy)
5. **AI-da harada istifadə olunur**
6. **İmtahan tipli tapşırıqlar**

## Faydalı mənbələr

- 3Blue1Brown — *Essence of Linear Algebra* / *Essence of Calculus* (vizual intuisiya)
- *Mathematics for Machine Learning* — Deisenroth, Faisal, Ong (pulsuz: mml-book.github.io)
- Khan Academy — ehtimal və statistika

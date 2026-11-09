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

# 🎯 Yoxlama işi 1 (Quiz 1) — hazırlıq

**Fənn:** Süni intellekt və maşın öyrənməsi modelləri · **Müəllim:** Kamran Əsgərov (AzTU)
**Material:** «Yoxlama işi 1: hazırlıq kitabı» (21 səhifə). Sualların hamısı bu kitabdan gəlir.

## 📋 Quizin formatı (50 bal, 80 dəqiqə, kalkulyator lazım deyil)

| Hissə | Sual növü | Bal | Hazırlıq faylı |
|---|---|---|---|
| **A** | Test: 10 sual, a/b/c/d | 10 | bütün [konspektlər](../../01-lectures/) |
| **B** | Doğru, yoxsa yanlış: 10 iddia | 10 | [tele-dogru-yanlis.md](tele-dogru-yanlis.md) |
| **C** | 8 alim ↔ 10 iş (2 iş artıqdır) | 8 | [adamlar-iller.md](adamlar-iller.md) |
| **D** | 6 tapşırıq ↔ 8 model (2 model artıqdır) | 6 | [model-secimi.md](model-secimi.md) |
| **E** | Kiçik hesablamalar | 8 | [hesablamalar ↓](#-e-hissəsi-hesablamalar) |
| **F** | Qısa cavab: tərif və nümunə | 8 | konspektlərin sonundakı suallar |

**Bal → qiymət:** 0–4 → 1 · 5–9 → 2 · 10–14 → 3 · 15–19 → 4 · 20–24 → 5 · 25–29 → 6 · 30–34 → 7 · 35–39 → 8 · 40–44 → 9 · **45–50 → 10**

## 📚 Beş mühazirə
1. [Süni intellektə giriş](../../01-lectures/01-si-giris.md): Sİ, agent, tarix, Turinq testi, ML paradiqmaları, metrikalar
2. [Neyron şəbəkələr](../../01-lectures/02-neyron-sebekeler.md): neyron, perseptron, XOR, aktivasiya, qradiyent enişi
3. [Arxitekturalar](../../01-lectures/03-arxitekturalar.md): CNN, RNN, LSTM, Transformer, GAN, diffuziya, LLM
4. [Xətti modellər](../../01-lectures/04-xetti-modeller.md): ƏKK, Ridge, Lasso, logistik reqressiya, softmax, GLM
5. [Ehtimal modelləri](../../01-lectures/05-ehtimal-modelleri.md): Bayes, eşik, sadəlövh Bayes, MLE, MAP, qeyri-səlislik

## 🧮 E hissəsi: hesablamalar
Hər hesablama növünün ayrıca riyaziyyat faylı var. Hər faylda izah, həll olunmuş misal və **cavabı gizli tapşırıqlar** var.

| Hesablama | Düstur | Fayl |
|---|---|---|
| Neyronun çıxışı | $z = w_1x_1 + w_2x_2 + b$, pilləli və ReLU | [neyronun-cebri](../../02-math/01-linear-algebra/neyronun-cebri.md) |
| Parametrlərin sayı | $n\cdot m + m$ | [neyronun-cebri](../../02-math/01-linear-algebra/neyronun-cebri.md) |
| Konvolyusiyanın çıxışı | $W - k + 1$ | [neyronun-cebri](../../02-math/01-linear-algebra/neyronun-cebri.md) |
| Qradiyent enişi | $w - \eta\cdot dL/dw$ | [qradiyent-enisi](../../02-math/02-calculus/qradiyent-enisi.md) |
| Metrikalar | düzgünlük, dəqiqlik, tamlıq | [metrikalar](../../02-math/03-probability-statistics/metrikalar.md) |
| Xətlə proqnoz | $\hat y = w_0 + w_1x$, $e = y - \hat y$ | [xetti-reqressiya](../../02-math/04-optimization/xetti-reqressiya-ve-requlyarlasdirma.md) |
| Logistik qərar, şans | $z>0 \Rightarrow$ sinif 1, $p/(1-p)$ | [logistik-ve-softmax](../../02-math/03-probability-statistics/logistik-ve-softmax.md) |
| Bayes (1000 nəfər) | xəstə müsbətlər / bütün müsbətlər | [bayes-ve-qerar](../../02-math/03-probability-statistics/bayes-ve-qerar.md) |
| Eşik və Laplas | $c_{FP}/(c_{FP}+c_{FN})$, $(k+1)/(n+2)$ | [bayes-ve-qerar](../../02-math/03-probability-statistics/bayes-ve-qerar.md) |
| Qeyri-səlis əməliyyatlar | min, max, $1-\mu$ | [qeyri-selis-mentiq](../../02-math/05-discrete-math-logic/qeyri-selis-mentiq.md) |

## 🗓️ Hazırlıq planı
- [ ] **1-ci gün:** 5 konspekti oxu, hər mühazirənin «Bir dəqiqədə» hissəsini başa düş
- [ ] **2-ci gün:** 10 hesablama növünün hər birindən tapşırıqları **cavaba baxmadan** həll et
- [ ] **3-cü gün:** [adamlar-iller.md](adamlar-iller.md) və [model-secimi.md](model-secimi.md) faylları üzərində özünü yoxla
- [ ] **4-cü gün:** [tele-dogru-yanlis.md](tele-dogru-yanlis.md), sonra **[sınaq quizini](sinaq-quiz.md)** vaxt ölçərək 80 dəqiqəyə yaz
- [ ] **5-ci gün:** səhvlərini [mistakes.md](../mistakes.md) faylına yaz, sonra [cheat-sheet](../cheatsheet.md) faylını təkrarla
- [ ] **Quizdən əvvəlki axşam:** kitabın 20-ci səhifəsini və cheat-sheet-i bir də oxu

## ✅ Quiz günü üçün məsləhətlər
1. Əvvəlcə bütün vərəqə bax, asan suallardan başla.
2. A və B hissələrində heç bir sualı boş qoyma.
3. Uyğunlaşdırma suallarında hər hərf ən çoxu bir dəfə işlənir və 2 hərf artıq qalır.
4. Hesablamada düsturu və hər addımı yaz.
5. Qısa cavabda iki şey yaz: **tərif + nümunə**.
6. Sonda 5 dəqiqə saxla və cavablarını yoxla.

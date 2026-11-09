# 📌 Cheat-sheet: Quiz 1

İmtahandan əvvəl 15 dəqiqəlik təkrar üçün.

## ★ Yeddi cümlədə hər şey
1. Sİ insan zəkası tələb edən və qaydaları əvvəlcədən yazmaqla həll olunmayan işləri görür.
2. Generativ Sİ ⊂ dərin öyrənmə ⊂ maşın öyrənməsi ⊂ Sİ.
3. Neyronun bütün biliyi çəkilərdə və sürüşmədədir. Öyrənmə itkini kiçiltməkdir.
4. CNN şəkillər, RNN ardıcıllıqlar üçündür. Transformer hər şey üçün işləyir: hər söz hər sözə baxır.
5. Logistik reqressiya təsnifat modelidir. Softmax K sinif üçündür və dil modellərinin son qatıdır.
6. Nadir xəstəlikdə müsbət test az şey deyir. Bunu saymaqla hesablayın.
7. Dərəcə ehtimal deyil: «bir az isti» ilə «isti olma ehtimalı» fərqli şeylərdir.

## 🧮 Düsturlar (E hissəsi)

| Ad | Düstur |
|---|---|
| Neyron | $z = w_1x_1 + w_2x_2 + b$; pilləli: $z\ge0 \to 1$; ReLU $=\max(0,z)$ |
| Qatın parametrləri | $n\cdot m + m$ |
| Qradiyent enişi | $w \leftarrow w - \eta\cdot dL/dw$ |
| Konvolyusiya ($p=0$, $s=1$) | $W - k + 1$; 2×2 pulinq ölçünü yarıya endirir |
| Xətt | $\hat y = w_0 + w_1x$, qalıq $e = y - \hat y$ |
| Sigmoid | $\sigma(0) = 0{,}5$; $z>0 \Leftrightarrow p>0{,}5$; şans $= p/(1-p)$ |
| Metrikalar | düzgünlük $=(TP+TN)/\text{hamısı}$, dəqiqlik $=TP/(TP+FP)$, tamlıq $=TP/(TP+FN)$ |
| Bayes (1000 nəfər) | xəstə müsbətlər / bütün müsbətlər |
| Eşik | $c_{FP}/(c_{FP}+c_{FN})$ |
| Laplas | $(k+1)/(n+2)$ |
| Qeyri-səlis | VƏ = min, VƏ YA = max, DEYİL = $1-\mu$ |

## 🔢 Mütləq yadda saxlanmalı rəqəmlər
- Sİ qışları: **1974–1980, 1987–1993**. Neyron şəbəkələrin qışları: **1969–1982, 1997–2006**
- Turinq testi 2025: GPT-4.5 **73%**, ELIZA 23%, GPT-4o 21%
- AlexNet: top-5 səhvi **26% → 15%**, 8 qat, 60 milyon parametr. ResNet 3,6%, insan ~5,1%
- Neyron: sükunət −70 mV, hədd −55 mV, impuls +40 mV. Beyin: 86 milyard neyron, ~20 Vt
- LSTM-də **3** qapı, GRU-da **2** qapı. GAN-da **2** şəbəkə. Pulinqin parametri **0**
- ChatGPT: **30 noyabr 2022**. Transformer: **2017**. Dartmut: **1956**
- Bayes: 1%, 90%, 9% verilibsə, cavab ≈ **9%**

## 🧠 Qarışdırılan cütlər
| Bu | O |
|---|---|
| Ridge (L2): əmsalları kiçildir, sıfır etmir | Lasso (L1): bəzi əmsalları sıfıra endirir |
| BERT: koder, iki tərəfli baxış | GPT: dekoder, növbəti tokeni proqnozlaşdırır |
| Generativ model: $p(x\mid y)$ öyrənir, yeni nümunə yaradır | Diskriminativ model: $P(y\mid x)$ öyrənir, yalnız sərhədi bilir |
| Aleatorik: verilənin küyüdür, yeni verilənlə azalmır | Epistemik: bilik çatışmazlığıdır, yeni verilənlə azalır |
| Dəqiqlik: məxrəcdə FP | Tamlıq: məxrəcdə FN |
| MLE: yalnız verilənlərə baxır | MAP: aprioru da nəzərə alır |
| Güclü Sİ (Sörl rədd edir) | Zəif Sİ (Sörl razılaşır) |

## 📚 Daha ətraflı
[Quiz 1 qovluğu](quiz-1/) · [Adamlar və illər](quiz-1/adamlar-iller.md) · [Model seçimi](quiz-1/model-secimi.md) · [Tələlər](quiz-1/tele-dogru-yanlis.md)

# 🧭 Öyrənmə xəritəsi: ilk 12 həftə (16 noyabr 2026 – 7 fevral 2027)

> Bu, [ROADMAP.md](ROADMAP.md)-dakı **Mərhələ 1**-in gün-gün planıdır.
> **Məqsəd:** 12 həftəyə sıfırdan Python yazmağı öyrənmək **və** AI dərsində əzbərlədiyin mövzuları kodla **həqiqətən başa düşmək**.

---

## 💡 Bu plan niyə belə qurulub?

Quizdən sonra özün dedin: **«oxudum, yazdım, amma tam anlamıram»**. Səbəbi sadədir: oxumaq **tanımaq** verir, **anlamaq** isə bir şeyi **öz əlinlə qurduqda** gəlir.

Ona görə bu planda hər Python mövzusunu dərhal **AI dərsindəki bir mövzuya** tətbiq edirik:

| Python-da öyrəndiyin | Onunla quracağın | Nəyi həqiqətən başa düşəcəksən |
|---|---|---|
| funksiyalar | metrikalar kalkulyatoru | accuracy, precision, recall |
| şərtlər (`if`) | neyron, pilləli funksiya, ReLU | neyron necə «qərar verir» |
| dövrlər (`for`) | qradiyent enişi | model necə öyrənir, böyük η niyə «sıçrayır» |
| `random` kitabxanası | 1000 nəfərlik Bayes simulyasiyası | test müsbət olanda ehtimal niyə cəmi 9%-dir |
| siniflər (OOP) | öyrənən perseptron | perseptron niyə XOR-u öyrənə bilmir |
| numpy | matrislərlə neyron qatı | parametrlərin sayı niyə `n·m + m`-dir |
| numpy + qrafik | sıfırdan xətti və logistik reqressiya | ƏKK, sigmoid, qərar sərhədi |

12 həftənin sonunda quizdəki mövzuların çoxunu **kodla qurmuş** olacaqsan. Bu zaman əzbər yox, **anlayış** qalır.

---

## ⏱️ Gündəlik və həftəlik ritm

| Gün | Vaxt | Nə edirsən |
|---|---|---|
| **B.e. – Cümə** | ~1 saat | **25 dəq** öyrən (video, kurs) → **25 dəq** özün yaz və et → **5 dəq** [journal](journal/) qeydi və commit 🟩 |
| **Şənbə** | ~2 saat | 🛠️ **həftənin layihəsi**: öyrəndiyini bir proqrama çevir və `05-code/`-a push et |
| **Bazar** | ~30–45 dəq | 🔁 **həftəlik yoxlama**: Claude-a «Həftəlik yoxlama: Həftə N» yaz. Keçən həftədən və `mistakes.md`-dən test verəcəm |

### Qaydalar
1. **Əvvəl et, sonra oxu.** Videoda gördüyün hər kodu **özün yaz**, kopyalama.
2. **20 dəqiqə ilişib qalmısansa**, Claude-a yaz. Vaxt itirmə.
3. **Pis gündə də 10 dəqiqə ver** və journal-a bir cümlə yaz. Zənciri qırma.
4. **İmtahan və ya quiz həftəsində bu plan dayanır.** Material atırsan, ona hazırlaşırıq, sonra qaldığın yerdən davam edirik.
5. **Yeni mühazirə gələndə** onu həmin həftə çərşənbə və ya cümə gününə qoyuruq. Konspekt və sadə izahı mən hazırlayıram, sən testi həll edirsən.

### Əsas mənbələr (hamısı pulsuzdur)
- 🐍 **CS50P**, Harvard: *CS50's Introduction to Programming with Python* (cs50.harvard.edu/python). Hər «Lecture» video + «Problem Set»
- 📐 **3Blue1Brown**: *Essence of Linear Algebra* və *Essence of Calculus* (YouTube)
- 📊 **Kaggle Learn**: *Pandas*, *Intro to Machine Learning* (kaggle.com/learn)

---

## 🟢 Həftə 0: hazırlıq (14–15 noyabr, bu həftəsonu)
- [ ] **Şənbə:** [Mühazirə 4, sadə izah](01-lectures/04-xetti-modeller-sade.md) faylını oxu və sonundakı testi Claude-a yaz
- [ ] **Şənbə:** Python və VS Code-u quraşdır (python.org, code.visualstudio.com). `print("Salam, AI!")` işləsin
- [ ] **Bazar:** [Mühazirə 5, sadə izah](01-lectures/05-ehtimal-modelleri-sade.md) faylını oxu və testi Claude-a yaz
- [ ] **Bazar:** Claude-a «Python yoxlaması» yaz. 5 kiçik tapşırıq verəcəm. Python-u artıq bilirsənsə, ilk həftələri sürətlə keçəcəyik

---

## 📅 Ay 1: Python əsasları + AI anlayışları kodla

### Həftə 1 (16–22 noyabr): funksiyalar və dəyişənlər
- [ ] B.e. CS50P **Lecture 0** (Functions, Variables): videonun 1-ci yarısı, kodları özün yaz
- [ ] Ç.a. Lecture 0: videonun 2-ci yarısı
- [ ] Çər. **Problem Set 0**: 2 tapşırıq
- [ ] C.a. Problem Set 0: qalan tapşırıqlar
- [ ] Cümə 🧠 «Sİ ⊃ ML ⊃ DL ⊃ GenAI» mövzusunu **öz sözlərinlə** 10 cümlədə journal-a yaz. Claude yoxlayacaq
- [ ] 🛠️ **Şənbə:** `05-code/algorithms/metrics.py`. Bu funksiyaları yaz: `accuracy(tp, tn, fp, fn)`, `precision(...)`, `recall(...)`. Quizdəki `TP = 8, FN = 2, FP = 4, TN = 86` nümunəsi ilə yoxla
- [ ] 🔁 Bazar: həftəlik yoxlama

### Həftə 2 (23–29 noyabr): şərtlər (`if`)
- [ ] B.e.–Ç.a. CS50P **Lecture 1** (Conditionals)
- [ ] Çər.–C.a. **Problem Set 1**
- [ ] Cümə 🔁 `mistakes.md` faylını təkrarla və Mühazirə 2-nin sadə hissələrini yenidən oxu
- [ ] 🛠️ **Şənbə:** `05-code/algorithms/neuron.py`. `step(z)` və `relu(z)` funksiyalarını `if` ilə yaz. `z = w1·x1 + w2·x2 + b` hesablayan `neuron(x1, x2, w1, w2, b)` funksiyasını yaz. Quizdəki bütün neyron nümunələri ilə yoxla
- [ ] 🔁 Bazar: həftəlik yoxlama

### Həftə 3 (30 noyabr – 6 dekabr): dövrlər (`for`, `while`)
- [ ] B.e.–Ç.a. CS50P **Lecture 2** (Loops)
- [ ] Çər.–C.a. **Problem Set 2**
- [ ] Cümə 🧠 `count_params([784, 128, 10])` funksiyasını yaz: qatların siyahısını dövrlə gəzib `n·m + m` cəmini tapsın. Nəticə **101 770** olmalıdır
- [ ] 🛠️ **Şənbə:** `05-code/algorithms/gradient_descent.py`. `L = (w − 3)²`, `w = 0` götür, 20 addım at və hər addımda `w`-ni çap et. Sonra η = 0.1, η = 1 və η = 1.1 ilə təkrarla. **Böyük η-nın sıçradığını öz gözünlə gör** 👀
- [ ] 🔁 Bazar: həftəlik yoxlama

### Həftə 4 (7–13 dekabr): xətalar + kitabxanalar
- [ ] B.e. CS50P **Lecture 3** (Exceptions)
- [ ] Ç.a. CS50P **Lecture 4** (Libraries): `random`, `statistics`
- [ ] Çər.–C.a. Problem Set 3 və 4-dən 2–3 tapşırıq
- [ ] Cümə 🧠 `05-code/algorithms/fuzzy.py`: Zadənin AND = min, OR = max, NOT = 1 − μ əməliyyatları və «isti» üzvlük funksiyası
- [ ] 🛠️ **Şənbə:** `05-code/algorithms/bayes_simulation.py`. `random` ilə 100 000 «insan» yarat: 1%-i xəstə olsun, test 90% və 9% qaydası ilə işləsin. Testi müsbət olanların neçə faizi xəstədir? **Simulyasiya da ≈ 9% göstərəcək** 🤯
- [ ] 🔁 Bazar: **Ay 1-in yekunu.** Claude ilə 20 suallıq qarışıq test

---

## 📅 Ay 2: struktur kod + riyaziyyatın intuisiyası

### Həftə 5 (14–20 dekabr): testlər + fayllar
- [ ] B.e.–Ç.a. CS50P **Lecture 5** (Unit Tests): öz `metrics.py` və `neuron.py` fayllarına test yaz
- [ ] Çər.–C.a. CS50P **Lecture 6** (File I/O): CSV faylını oxumaq
- [ ] Cümə 📐 3Blue1Brown, *Essence of Linear Algebra*, **1-ci və 2-ci epizod** (vektorlar)
- [ ] 🛠️ **Şənbə:** `points.csv` faylında 5 nöqtə saxla, Python ilə oxu, sonra `ŷ = 1.1 + 1.6·x` proqnozlarını və qalıqları hesabla
- [ ] 🔁 Bazar: həftəlik yoxlama

### Həftə 6 (21–27 dekabr): siniflər (OOP)
- [ ] B.e.–Ç.a. CS50P **Lecture 8** (Object-Oriented Programming)
- [ ] Çər. 📐 3Blue1Brown, LA **3-cü epizod** (xətti çevrilmələr, matrislər)
- [ ] C.a.–Cümə Problem Set 8-dən 1–2 tapşırıq
- [ ] 🛠️ **Şənbə:** `05-code/algorithms/perceptron.py`. `Perceptron` sinfi yaz: `predict()` və `train()` metodları olsun, öyrənmə qaydası `w ← w + η·(y − ŷ)·x`. Onu **AND** və **OR** üzərində öyrət ✅. Sonra **XOR**-u yoxla: öyrənə bilməyəcək ❌. Minski 1969-da məhz bunu sübut edib, sən də öz gözünlə görəcəksən!
- [ ] 🔁 Bazar: həftəlik yoxlama

### Həftə 7 (28 dekabr – 3 yanvar): 🎄 yüngül həftə
- [ ] Hər gün 20–30 dəqiqə kifayətdir
- [ ] 📐 3Blue1Brown, LA **4-cü epizod** (matris vurması)
- [ ] CS50P **Lecture 9** (Et Cetera), sadəcə izlə
- [ ] Journal: **«2026-da nə öyrəndim?»** mövzusunda 1 səhifə yaz
- [ ] 🔁 Bazar: yüngül yoxlama

### Həftə 8 (4–10 yanvar): numpy, vektorlar və matrislər
- [ ] B.e.–Ç.a. numpy əsasları: `array`, toplama, `@` (skalyar hasil / dot product)
- [ ] Çər. Neyronu numpy ilə yenidən yaz: `z = w @ x + b`
- [ ] C.a. Bütün qatı bir sətirdə yaz: `z = W @ x + b`. W matrisinin ölçüsü `m × n`-dir. **Parametr düsturu buradan gəlir!**
- [ ] Cümə 📐 3Blue1Brown, LA **9-cu epizod** (dot product)
- [ ] 🛠️ **Şənbə:** `05-code/notebooks/numpy_neuron.ipynb`. 3 → 4 → 2 şəbəkəsinin irəli keçidi (forward pass), aktivasiya olaraq ReLU
- [ ] 🔁 Bazar: **Ay 2-nin yekunu**

---

## 📅 Ay 3: modelləri sıfırdan qurmaq (AI dərsi kodda!)

> ⚠️ Yanvarda qış imtahan sessiyası ola bilər. İmtahan həftəsi gələndə bu həftələr sadəcə **sürüşür**, heç nə itmir.

### Həftə 9 (11–17 yanvar): xətti reqressiya sıfırdan
- [ ] B.e. `matplotlib` əsasları: nöqtələri və xətti çəkmək
- [ ] Ç.a.–Çər. Xətti reqressiyanı **qradiyent enişi ilə** öyrət (Həftə 3-dəki dövrü xatırla!)
- [ ] C.a. 📐 3Blue1Brown, *Essence of Calculus*, **1-ci və 2-ci epizod** (törəmə)
- [ ] Cümə 🧠 Nəticəni normal tənliklərlə müqayisə et: hər iki üsul eyni xətti verməlidir
- [ ] 🛠️ **Şənbə:** `05-code/notebooks/linear_regression.ipynb`: qrafik + MSE + R²
- [ ] 🔁 Bazar: həftəlik yoxlama

### Həftə 10 (18–24 yanvar): logistik reqressiya sıfırdan
- [ ] B.e. `sigmoid` funksiyasını yaz və qrafikini çək. σ(0) = 0,5 olduğunu gör
- [ ] Ç.a.–Çər. Kiçik verilən dəsti üzərində logistik reqressiya öyrət (çarpaz entropiya + qradiyent enişi)
- [ ] C.a. Qərar sərhədini qrafikdə çək: `z = 0` xətti
- [ ] Cümə 🧠 Eşiyi 0,5-dən 0,2-yə dəyiş: precision və recall necə dəyişir? (Mühazirə 5-dəki risk mövzusu!)
- [ ] 🛠️ **Şənbə:** `05-code/notebooks/logistic_regression.ipynb`
- [ ] 🔁 Bazar: həftəlik yoxlama

### Həftə 11 (25–31 yanvar): pandas, real verilənlər
- [ ] B.e.–C.a. **Kaggle Learn: Pandas** kursu (6 qısa dərs)
- [ ] Cümə Titanic verilənlərini (kaggle.com/c/titanic) pandas ilə yüklə və araşdır
- [ ] 🛠️ **Şənbə:** `05-code/notebooks/titanic_eda.ipynb`. Kim xilas olub? Qadınlar, uşaqlar, hansı sinif?
- [ ] 🔁 Bazar: həftəlik yoxlama

### Həftə 12 (1–7 fevral): ilk real ML modeli + yekun
- [ ] B.e.–C.a. **Kaggle Learn: Intro to Machine Learning** (`scikit-learn`, qərar ağacı, train/validation)
- [ ] Cümə 🧠 Titanic üzərində öz `logistic_regression`-ını `scikit-learn`-ün `LogisticRegression` modeli ilə müqayisə et
- [ ] 🛠️ **Şənbə:** `05-code/README.md` yaz: 12 həftədə qurduqlarını göstər. Bu, **ilk portfolio səhifəndir** 🎉
- [ ] 🔁 Bazar: **Böyük yekun** + Mərhələ 2-yə (Andrew Ng, klassik ML) keçid planı

---

## ✅ 12 həftədən sonra nə bacaracaqsan?
- Python-da funksiya, şərt, dövr, sinif yazmaq, fayl oxumaq, test yazmaq
- numpy, pandas, matplotlib, scikit-learn kitabxanalarından istifadə etmək
- Neyronu, perseptronu, qradiyent enişini, xətti və logistik reqressiyanı **sıfırdan qurmaq**
- Bayes, metrikalar və overfitting mövzularını **əzbərdən yox, anlayaraq** izah etmək
- GitHub-da **12+ layihə faylı** və 80+ gün yaşıl xana 🟩

## 📊 İrəliləyiş
| Həftə | Mövzu | Status |
|---|---|---|
| 0 | Hazırlıq | 🟨 |
| 1 | Funksiyalar + metrikalar | ⬜ |
| 2 | Şərtlər + neyron | ⬜ |
| 3 | Dövrlər + qradiyent enişi | ⬜ |
| 4 | Kitabxanalar + Bayes simulyasiyası | ⬜ |
| 5 | Testlər + fayllar | ⬜ |
| 6 | OOP + perseptron | ⬜ |
| 7 | Yüngül həftə | ⬜ |
| 8 | numpy + qat | ⬜ |
| 9 | Xətti reqressiya | ⬜ |
| 10 | Logistik reqressiya | ⬜ |
| 11 | pandas + Titanic | ⬜ |
| 12 | scikit-learn + yekun | ⬜ |

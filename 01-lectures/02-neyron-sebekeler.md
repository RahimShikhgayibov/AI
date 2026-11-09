# Mühazirə 2 — Neyron şəbəkələr: beyindən dərin öyrənməyə

**Mənbə:** Quiz-1 hazırlıq kitabı, səh. 7–9 · **Riyaziyyat:** [neyronun cəbri](../02-math/01-linear-algebra/neyronun-cebri.md), [qradiyent enişi](../02-math/02-calculus/qradiyent-enisi.md)

## 🎯 Bir cümlədə
Neyron girişlərin çəkili cəmini hesablayıb aktivasiya funksiyasından keçirir: $\hat y = f(w \cdot x + b)$. Öyrənmə **itkini kiçiltmək** üçün çəkiləri dəyişməkdir.

## 🕰️ 80 illik tarix (neyron şəbəkələrin öz qışları var!)

| Dövr | Hadisələr |
|---|---|
| **1943–1969** 1-ci dalğa (kibernetika) | 1943 Makkalok–Pitts · 1949 Hebb · 1958 Perseptron · 1960 ADALINE |
| **1969–1982 ❄ qış** | «Perseptronlar» kitabı (XOR), maliyyə kəsildi |
| **1982–1997** 2-ci dalğa (konneksionizm) | 1982 Hopfild · 1986 geri yayılma · 1989 LeNet · 1997 LSTM |
| **1997–2006 ❄ qış** | SVM və başqa üsullar irəlidə idi |
| **2006–...** 3-cü dalğa (dərin öyrənmə) | 2006 dərin inam şəbəkələri · 2012 AlexNet · 2017 Transformer · 2022 ChatGPT · 2024 iki Nobel |

> ⚠️ **TƏLƏ:** Bütün Sİ sahəsinin qışları **1974–1980** və **1987–1993**-dür. Neyron şəbəkələrin qışları isə **1969–1982** və **1997–2006**-dır. Bunları qarışdırma!

## 🧬 Bioloji neyron → süni neyron

| Bioloji | Süni |
|---|---|
| dendritlər | girişlər $x_1, x_2, x_3$ |
| sinapslar | **çəkilər** $w_1, w_2, w_3$ |
| hüceyrə gövdəsi (soma) | cəm $z = w \cdot x + b$ |
| akson təpəciyi | aktivasiya $f(z)$ |
| akson | çıxış $\hat y$ |

- **«Hamısı və ya heç nə» prinsipi:** sükunət halında potensial −70 mV, hədd −55 mV-dir. Hədd keçiləndə impuls **həmişə eyni hündürlükdə** olur (+40 mV).
- **Güclü stimul impulsu böyütmür, impulsların sayını artırır.** Məlumat impulsların tezliyindədir.
- Beyində 86 milyard neyron, ~100 trilyon sinaps var və o cəmi ~20 vat enerji sərf edir.
- **Hebb qaydası (1949):** birlikdə aktivləşən neyronların arasındakı əlaqə güclənir: $\Delta w = \eta \cdot x \cdot y$.
- **Hubel və Vizel (1959, Nobel 1981):** görmə qatlarla qurulub: kənarlar → fiqurlar → obyektlər. Bu kəşf CNN-in ilham mənbəyidir (Fukusimanın neokoqnitronu, 1980).

## ⚙️ Süni neyronun inkişafı
1. **Makkalok–Pitts (1943):** cəmi hədd ilə müqayisə edir. İki girişdə hədd 2 olanda **VƏ**, hədd 1 olanda **VƏ YA** hesablayır. Çəkiləri insan seçirdi, neyron öyrənmirdi.
2. **Perseptron (Rozenblatt, 1958):** çəkilərini səhvindən özü öyrənir: $w \leftarrow w + \eta (y - \hat y) x$. Cavab düzdürsə, çəkilər dəyişmir.
   - Sinifləri **bir düz xətlə** ayırır, ona görə **XOR-u öyrənə bilmir**. Bunu Minski və Peypert 1969-da sübut etdilər.
   - **Həll:** bir gizli qat əlavə etmək. Gizli qatda iki neyron (VƏ YA və VƏ) kifayətdir.
3. **ADALINE (Uidrou, Hoff, 1960):** LMS qaydası, yəni bugünkü qradiyent öyrənməsinin əcdadı.

### Aktivasiya funksiyaları
| Funksiya | Düstur | Qiymət aralığı | Dövr |
|---|---|---|---|
| Pilləli | $z \ge 0 \Rightarrow 1$, yoxsa 0 | {0, 1} | 1943–1958 |
| Sigmoid | $\sigma(z) = 1/(1+e^{-z})$ | (0, 1), ehtimal kimi oxunur | 1980-lər |
| Tanh | $\tanh z$ | (−1, 1), sıfıra görə simmetrik | 1980–90-lar |
| **ReLU** | $\max(0, z)$ | [0, ∞) | 2010-dan (Nair, Hinton), AlexNet-dən sonra standart oldu |

**Niyə qeyri-xətti funksiya lazımdır?** Aktivasiya olmasa, qatların sayı nə qədər çox olsa da, bütün şəbəkə **bir xətti funksiyaya** çevrilir.

## 📉 Şəbəkə necə öyrənir
- **MLP:** giriş qatı → gizli qatlar → çıxış qatı. Qatlar **tam əlaqəlidir**. Məlumat irəli keçidlə girişdən çıxışa doğru axır.
- **İtki funksiyası:** reqressiyada $MSE = \frac1n \sum (y-\hat y)^2$, təsnifatda çarpaz entropiya $L = -\ln p$ işlədilir. Model əmin olub yanılanda itki çox böyük olur: $p=0{,}1 \Rightarrow L = 2{,}30$, $p = 0{,}9 \Rightarrow L = 0{,}11$.
- **Qradiyent enişi:** $w \leftarrow w - \eta \cdot \frac{dL}{dw}$. Burada $\eta$ öyrənmə sürətidir: onu **biz seçirik**, yəni hiperparametrdir. Çox kiçik $\eta$ öyrənməni yavaşladır, çox böyük $\eta$ isə minimumun üstündən «sıçrayır».
- **Geri yayılma (Rumelhart, Hinton, Uilyams, 1986):** səhv çıxışdan girişə doğru yayılır. Hər çəkinin səhvdəki payı **zəncir qaydası** ilə tapılır. Kökləri daha əvvələ gedir: Linnainmaa 1970, Verbos 1974.
- **Təlim dövrü:** partiya götür → irəli keçid → itkini hesabla → geri yayılma → çəkiləri yenilə → təkrar et.
  - **Partiya (batch):** bir addımda istifadə olunan nümunələr, məsələn 32 nümunə.
  - **Epoxa:** bütün təlim verilənlərindən bir dəfə keçmək.
  - **Erkən dayandırma:** validasiya itkisi artmağa başlayanda təlimi dayandırmaq.
  - Köməkçi üsullar: dropout (2012), Adam (2014), partiya normallaşdırması (2015).

## 🚀 Dərin öyrənmə niyə məhz indi?
**Üç yanacaq var:** verilənlər (ImageNet, 2009, Fey-Fey Li: 14 milyondan çox şəkil), **GPU**, alqoritmlər (ReLU, dropout, Adam, TensorFlow 2015, PyTorch 2016).

**AlexNet (2012):** 8 qat, 60 milyon parametr. ImageNet-də top-5 səhvi **26%-dən 15%-ə** endirdi. **ResNet (2015)** 3,6% ilə insan səviyyəsini (~5,1%) keçdi.

**Dərinlik nə verir?** Şəbəkə əlamətləri qatlarla özü qurur: piksellər → kənarlar → fiqurlar → hissələr → obyektlər.

## ❓ İmtahan sualları
1. Bioloji neyronun hissələrini süni neyronun hissələri ilə uyğunlaşdırın.
2. Perseptron niyə XOR-u öyrənə bilmir? Bu problem necə həll olunur?
3. Aktivasiya funksiyası olmasa, şəbəkəyə nə olar?
4. Öyrənmə sürəti ($\eta$) çox böyük olanda nə baş verir?
5. Neyron şəbəkələrin iki qışı hansı illərdə olub və hər birinin səbəbi nə idi?

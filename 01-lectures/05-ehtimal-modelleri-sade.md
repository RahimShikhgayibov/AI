# 📒 Mühazirə 5: Ehtimal modelləri (Probabilistic Models), sadə dildə izah

> Bu, [qısa konspektin](05-ehtimal-modelleri.md) geniş və sadə versiyasıdır. Sıfırdan başlayanlar üçün yazılıb.
> Riyaziyyat: [Bayes və qərar](../02-math/03-probability-statistics/bayes-ve-qerar.md) · [qeyri-səlis məntiq](../02-math/05-discrete-math-logic/qeyri-selis-mentiq.md)

---

## 0️⃣ Ümumi mənzərə
Dünya qeyri-müəyyəndir. Model «bu şəkil **92% ehtimalla** pişikdir» deyəndə ehtimal dilində danışır. Bu mühazirə 4 suala cavab verir:
1. Yeni sübut gələndə inamımı necə yeniləyim? → **Bayes teoremi**
2. Ehtimalı bilirəm. Qərarı necə verim? → **qərar və risk**
3. Ehtimalları verilənlərdən necə öyrənim? → **sadəlövh Bayes, MLE, MAP**
4. Qeyri-müəyyənliyin hansı növləri var? → **Bayes şəbəkələri, qeyri-səlislik, kalibrləmə**

---

## 1️⃣ Bayes teoremi (Bayes' Theorem): sübut gələndə inamı yeniləmək 🔄

### Məşhur sual (həkimlərin çoxu bu sualda səhv edir!)
- Qadınların **1%-ində** xəstəlik var.
- Xəstəlik varsa, test **90%** hallarda müsbət çıxır.
- Xəstəlik yoxdursa da, test **9%** hallarda səhvən müsbət çıxır.
- **Test müsbət çıxıb. Xəstə olma ehtimalı nədir?**

Çoxu «90%» deyir. **Düzgün cavab təxminən 9%-dir!** 2007-ci ildə aparılan sorğuda həkimlərin cəmi 21%-i düz cavab verdi.

### Həll yolu: faizləri insan sayına çevir (natural frequencies) 👥
1000 nəfərlik bir qrup təsəvvür et:
```
1000 nəfər
├── 10 xəstə (1%)
│   ├── 9 nəfərin testi müsbətdir  (90%)  ← həqiqi müsbət
│   └── 1 nəfərin testi mənfidir
└── 990 sağlam
    ├── ≈ 89 nəfərin testi müsbətdir (9%)  ← yalançı müsbət!
    └── 901 nəfərin testi mənfidir

Müsbət nəticələr: 9 + 89 = 98
Onlardan neçəsi xəstədir? 9 / 98 ≈ 0,09 → təxminən 9%
```
**Niyə belə azdır?** Sağlam insanlar çoxdur (990 nəfər). Onların cəmi 9%-i belə real xəstələrdən (9 nəfər) çox yalançı müsbət nəticə verir.

**Gerd Gigerenzer** sualı belə «1000 nəfər» dilində verəndə həkimlərin düz cavabları **21%-dən 87%-ə** qalxdı.

### Düstur və terminlər
```
P(H | E) = P(E | H) · P(H) / P(E)
```
`|` işarəsi «şərtilə» kimi oxunur: `P(xəstə | müsbət)` = «test müsbət olduğu halda xəstə olma ehtimalı».

| Hissə | Azərbaycanca | English | Nümunədə |
|---|---|---|---|
| P(H) | sübutdan **əvvəlki** inam | **prior** (aprior) | 1% |
| P(E \| H) | xəstədirsə, testin müsbət çıxma ehtimalı | **likelihood** (həqiqətəbənzərlik), testin **sensitivity**-si | 90% |
| P(E) | ümumiyyətlə müsbət nəticə ehtimalı | evidence | 98/1000 |
| P(H \| E) | sübutdan **sonrakı** inam | **posterior** (aposterior) | ≈ 9% |

⚠️ **Əsas səhv:** `P(müsbət | xəstə) = 90%` ilə `P(xəstə | müsbət) ≈ 9%` **eyni şey deyil!**

### Tarix 📜
- **Tomas Bayes** teoremi yazdı, amma dərc etmədi. Dostu **Riçard Prays (Richard Price) 1763-də** dərc etdi.
- **Laplas (Laplace), 1774:** ideyanı hesablama alətinə çevirdi.
- **Alan Turinq, 1940–1941:** Enigma şifrəsini açanda Bayes qaydasından istifadə etdi.
- **AF447 təyyarəsi:** okeana düşən təyyarəni iki il tapa bilmədilər. Bayes xəritəsi ilə qalıqlar **bir həftəyə** tapıldı.

---

## 2️⃣ Qərar və risk (Decision & Risk) ⚖️

### Bayes qərar qaydası
Ən sadə qayda: **ən ehtimallı sinfi seç**. Bu qayda ilə əldə edilən ən kiçik mümkün səhvə **Bayes xətası (Bayes error)** deyilir. Eyni əlamətlərlə heç bir model ondan az səhv edə bilməz. Bunu azaltmaq üçün **yeni əlamət** lazımdır.

### Amma səhvlərin qiyməti fərqlidir!
Spam süzgəcində iki cür səhv ola bilər:
- **FP (false positive):** vacib məktubu spama atmaq. Bu, **çox pisdir**, iş təklifi itə bilər!
- **FN (false negative):** bir spamı buraxmaq. Bu, sadəcə **bir az narahatlıqdır**.

Ona görə eşik (threshold) 0,5 yox, **səhvlərin qiymətinə görə** seçilir:
```
eşik = c_FP / (c_FP + c_FN)
```
| Vəziyyət | Hansı səhv bahadır? | Hesab | Eşik |
|---|---|---|---|
| Spam | məktubu itirmək 9 dəfə pisdir (c_FP = 9, c_FN = 1) | 9 / (9 + 1) | **0,9** (çox əmin olanda «spam» de) |
| Xərçəng skrininqi | xəstəni buraxmaq 19 dəfə pisdir (c_FP = 1, c_FN = 19) | 1 / (1 + 19) | **0,05** (az şübhə olsa belə yoxla) |
| Kart fırıldağı | buraxmaq 4 dəfə pisdir (c_FP = 1, c_FN = 4) | 1 / (1 + 4) | **0,2** |

🧠 **Yadda saxlamaq üçün:** FP bahadırsa, eşik **yüksək** olur (ehtiyatlı ol). FN bahadırsa, eşik **aşağı** olur (həssas ol). Səhvlərin qiyməti bərabərdirsə, eşik 0,5-dir. Bu qaydanı **Abraham Vald (Wald), 1950** irəli sürüb.

**«Bilmirəm» də qərardır (reject option, Chow):** model əmin deyilsə, qərarı insana ötürür. Ona görə model sadəcə «hə» və ya «yox» yox, **ehtimal** verməlidir.

---

## 3️⃣ Generativ və diskriminativ modellər (Generative vs Discriminative) 🧩

| | **Generativ** | **Diskriminativ** |
|---|---|---|
| Hansı sualı verir | «Hər sinif **necə görünür**?» | «Sinifləri **nə ayırır**?» |
| Analogiya | pişiyin və itin portretini çəkməyi öyrənir | yalnız onları ayıran xətti öyrənir |
| Yeni nümunə yarada bilirmi | ✅ bəli | ❌ xeyr |
| Nümunələr | **sadəlövh Bayes**, LDA, QDA, dil modelləri | **logistik reqressiya**, SVM, qərar ağacı, neyron şəbəkələr |
| Üstünlüyü | az verilənlə tez öyrənir (Ng və Jordan, 2001) | — |

### Sadəlövh Bayes (Naive Bayes): spam süzgəcinin klassiki 📧
1. Spam məktublarda hər sözün neçə dəfə keçdiyini sayırıq. Normal məktublarda da eyni şeyi edirik.
2. Yeni məktub gələndə hər söz bir «sübut» kimi qəbul olunur. Məsələn, «prize» sözü spamda çox keçir, deməli spam ehtimalını artırır.
3. **«Sadəlövh» (naive) fərziyyə:** sözlər bir-birindən **asılı olmayan** kimi qəbul edilir. Real həyatda belə deyil («free» və «money» birlikdə gəlir), amma model yenə də yaxşı işləyir!

```
P(spam | sözlər) ∝ P(spam) × P(söz₁ | spam) × P(söz₂ | spam) × …
```
**Tarix:** 1998 Microsoft Research · **2002 Pol Qrem (Paul Graham), «A Plan for Spam»** · 2017 Gmail, 99,9%-dən çox dəqiqlik.

### LDA və QDA
Hər sinif bir «bulud» kimi təsəvvür olunur (Gauss paylanması).
- **LDA:** bütün buludların forması eynidir, ona görə sərhəd **düz xətt** olur.
- **QDA:** hər buludun öz forması var, ona görə sərhəd **əyri** olur.
- İdeya **Fişerə (Fisher), 1936** məxsusdur (İris verilənləri). Müasir nümunə: Palmer pinqvinləri, LDA ilə 98,8%.

---

## 4️⃣ Ehtimalı verilənlərdən öyrənmək: MLE və MAP 🎯

### MLE: Maksimal həqiqətəbənzərlik (Maximum Likelihood Estimation, Fisher 1922)
**Yalnız verilənlərə** baxır:
```
θ = uğurların sayı / bütün sınaqlar = k / n
```
Sikkəni 10 dəfə atırıq, 7 dəfə gerb gəlir: `θ = 7/10 = 0,7`.

**Problem:** sikkəni 3 dəfə atırıq, 3 dəfə də gerb gəlir. MLE deyir: `θ = 3/3 = 1`, yəni «sikkə **heç vaxt** yazı düşməyəcək». Bu, açıq-aşkar səhvdir!

### MAP: Maksimal aposterior (Maximum A Posteriori)
**Verilənlərə + əvvəlki biliyə (prior)** baxır.
Nümunə: yeni açılan restoranın 4 rəyinin hamısı müsbətdir. Amma şəhərdə restoranların orta reytinqi 80%-dir. MAP «100% əladır» demir, təxminən **92%** deyir. Rəylər çoxaldıqca əvvəlki biliyin təsiri azalır.

**Maraqlı əlaqə:** prior əslində **requlyarlaşdırmanın özüdür** (Mühazirə 4)!
- Gauss prioru → Ridge (L2)
- Laplas prioru → Lasso (L1)

### Laplas hamarlaması (Laplace smoothing) 🧮
```
(k + 1) / (n + 2)
```
**Niyə lazımdır?** «prize» sözü 8 normal məktubun heç birində keçməyib:
- MLE: `0/8 = 0`. Sadəlövh Bayesdə ehtimallar vurulur, bir sıfır isə **bütün hasili sıfıra** çevirir! Model ilişib qalır.
- Laplas: `(0 + 1) / (8 + 2) = 0,1`. Kiçikdir, amma sıfır deyil ✅

3 atışda 3 gerb gəlibsə: MLE 1 verir, Laplas isə `(3 + 1) / (3 + 2) = 0,8`.

---

## 5️⃣ Bayes şəbəkələri (Bayesian Networks) və səbəbiyyət 🕸️

### Cudia Perl (Judea Pearl), 1988 (Turinq mükafatı 2011)
Dəyişənləri qrafda düyünlər kimi çəkirik. **Ox «birbaşa təsir edir» deməkdir.**

```
  Oğru 🦹        Zəlzələ 🌍
     ↘          ↙
    Siqnalizasiya 🚨
     ↙          ↘
 Cavid zəng      Məryəm zəng
 edir 📞         edir 📞
```
- Siqnalizasiya işləyib. Oğru ehtimalı: **0,374**.
- Sonra radioda zəlzələ xəbəri gəlir. Oğru ehtimalı **0,003-ə** düşür!
- Səbəb: zəlzələ siqnalı artıq izah edir. Buna **izah edilib aradan qalxma (explaining away)** deyilir.

### Perlin səbəbiyyət nərdivanı (Ladder of Causation)
1. **Görmək (seeing):** korrelyasiya. «Barometr düşür, fırtına gəlir.» Bugünkü ML-in çoxu bu pillədədir.
2. **Etmək (doing):** müdaxilə. «Barometrin əqrəbini əllə çevirsəm, fırtına olarmı?» **Xeyr!**
3. **Təsəvvür etmək (imagining):** «Olmasaydı, nə olardı?» (counterfactual)

> **Korrelyasiya səbəb deyil (correlation ≠ causation).**

### Simpson paradoksu (Simpson's Paradox)
Böyrək daşları (1986): **hər qrupda** (kiçik daşlar və böyük daşlar) A müalicəsi daha yaxşıdır, amma **cəmdə** B yaxşı görünür! Səbəb: həkimlər çətin halları (böyük daşları) A ilə müalicə edirdi. Daşın ölçüsü **qarışdırıcı dəyişəndir (confounder)**.

---

## 6️⃣ Qeyri-səlis məntiq (Fuzzy Logic): Bakıdan Berkliyə 🇦🇿

### Lütfi Zadə (Lotfi Zadeh)
- **4 fevral 1921-də Bakıda** doğulub, 1959-dan Berklidə (ABŞ) işləyib.
- **1965:** «Fuzzy Sets» məqaləsini dərc edib. 100 000-dən çox istinad alıb.
- 2017-də vəfat edib, Bakıda **Fəxri xiyabanda** dəfn olunub.

### İdeya
Adi məntiqdə «isti» 30 °C-dən başlayırsa, 29,9 °C isti sayılmır, 30,1 °C isə isti sayılır. **İnsan belə danışmır!**

Qeyri-səlis məntiqdə hər temperatur «isti» çoxluğuna **0 ilə 1 arasında bir dərəcə** ilə aiddir. Buna **üzvlük funksiyası (membership function)** deyilir, işarəsi **μ**-dür.
```
«İsti» 24 °C-dən 32 °C-yə qədər artır:
μ(29) = (29 − 24) / (32 − 24) = 5/8 = 0,625   → «kifayət qədər isti»
```

### Zadənin əməliyyatları 🧮
```
VƏ (AND)     = min      →  min(0,6; 0,7) = 0,6
VƏ YA (OR)   = max      →  max(0,6; 0,7) = 0,7
DEYİL (NOT)  = 1 − μ    →  1 − 0,6 = 0,4
```

### Harada işlədilir?
- **Mamdani, 1975:** sözlə yazılmış qaydalarla («təzyiq yüksəkdirsə, istiliyi bir az azalt») buxar maşınını idarə etdi.
- **Sendai metrosu (Yaponiya, 1987, Hitachi):** qatarları qeyri-səlis qaydalar idarə edirdi, ~10% enerji qənaət olundu.
- Paltaryuyan maşınlar, kondisionerlər, kameraların avtofokusu.

### ⚠️ ƏN VACİB: dərəcə ehtimal DEYİL!
| Ehtimal | Qeyri-səlislik |
|---|---|
| «Sabah yağış yağacaqmı?» | «Bu gün hava istidir?» |
| Hadisə ya olacaq, ya olmayacaq, biz sadəcə **bilmirik** | Hər şey məlumdur (29 °C), qeyri-müəyyən olan **sözün özüdür** |
| 0,4 «40% ehtimalla» deməkdir | 0,4 «**bir az** isti» deməkdir |
| cəm 1 olmalıdır | belə tələb yoxdur |

---

## 7️⃣ Qeyri-müəyyənliyin növləri (Types of Uncertainty) 🌦️

| **Aleatorik (aleatoric)**: latınca *alea*, «zər» | **Epistemik (epistemic)**: yunanca *episteme*, «bilik» |
|---|---|
| verilənin özündəki təsadüf və küy | modelin **bilgisizliyi** |
| zər atmaq: nə qədər öyrənsən də, nəticəni bilməyəcəksən | heç görmədiyin ölkənin havasını proqnozlaşdırmaq |
| yeni verilən onu **azaltmır** ❌ | yeni verilən onu **azaldır** ✅ |

- **Kalibrləmə (calibration):** model «90% əminəm» deyirsə, belə halların ~90%-ində haqlı olmalıdır. Sadəlövh Bayes adətən **həddən artıq əmin** olur. Düzəliş: temperatur miqyaslaması (temperature scaling, Mühazirə 4-dəki temperaturu xatırla).
- **Hava proqnozu:** model bir cavab yox, onlarla ssenari hazırlayır (ensemble). «Yağış ehtimalı 70%» o deməkdir ki, ssenarilərin 70%-ində yağış yağır.
- **Konformal proqnoz (conformal prediction), Vovk, 2005:** model bir cavab əvəzinə **cavab çoxluğu** və zəmanət verir, məsələn «90% ehtimalla düz cavab bu çoxluğun içindədir».
- **Dil modelləri niyə uydurur (hallucinate)?** Testlərdə «bilmirəm» 0 bal alır, təxmin isə bəzən düz çıxır. Ona görə model **təxmin etməyə öyrəşir** (OpenAI, 2025).

---

## 8️⃣ ⚠️ Tələlər
| İddia | Cavab |
|---|---|
| Testin həssaslığı 90%-dirsə, müsbət nəticə 90% xəstəlik deməkdir | **Y**: nadir xəstəlikdə ≈ 9% ola bilər |
| Eşik həmişə 0,5 olmalıdır | **Y**: səhvlərin qiymətindən asılıdır |
| Sadəlövh Bayes sözlər arasındakı əlaqəni nəzərə alır | **Y**: sözləri bir-birindən asılı saymır, «sadəlövh» adı buradandır |
| Bayes şəbəkəsində ox «eyni şeydir» deməkdir | **Y**: «birbaşa təsir edir» deməkdir |
| Üzvlük dərəcəsi ehtimaldır | **Y** |
| Epistemik qeyri-müəyyənlik yeni verilənlə azalır | **D** |
| Korrelyasiya səbəb deməkdir | **Y** |

---

## ✍️ Özünü yoxla
1. 1000 nəfərdən 20-si xəstədir. Test xəstələrin 80%-ni tapır, sağlamların 5%-nə səhvən «müsbət» deyir. Neçə müsbət nəticə alınır? Testi müsbət çıxan adamın xəstə olma ehtimalı nədir?
2. `c_FP = 1`, `c_FN = 3`. Eşik nədir?
3. 10 atışda 7 gerb. MLE və Laplas qaydası nə verir?
4. `μ_soyuq = 0,3`, `μ_küləkli = 0,8`. VƏ, VƏ YA və «soyuq DEYİL» nədir?
5. Generativ ilə diskriminativ model arasındakı fərq nədir? Hər birinə bir nümunə yazın.
6. D/Y: «Aleatorik qeyri-müəyyənlik yeni verilənlə azalır.»
7. Bayes şəbəkələrini kim, hansı ildə yaradıb?
8. Lütfi Zadə hansı ildə qeyri-səlis çoxluqları təklif edib və harada doğulub?

<details><summary>Cavablar</summary>

1. xəstə müsbətlər 16, sağlamlar 980 nəfər, onlardan 49-u müsbət → cəmi 65 müsbət, ehtimal `16/65 ≈ 0,25`
2. `1 / (1 + 3) = 0,25`
3. MLE 0,7 · Laplas `8/12 ≈ 0,67`
4. VƏ 0,3 · VƏ YA 0,8 · soyuq DEYİL 0,7
5. Generativ model hər sinfin necə göründüyünü öyrənir və yeni nümunə yarada bilir (sadəlövh Bayes, GAN). Diskriminativ model yalnız sinifləri ayıran sərhədi öyrənir (logistik reqressiya, SVM).
6. Y: aleatorik qeyri-müəyyənlik verilənin özündəki təsadüfdür
7. Cudia Perl (Judea Pearl), 1988
8. 1965 · Bakı (1921)

</details>

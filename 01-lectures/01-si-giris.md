# Mühazirə 1 — Süni intellektə giriş və modellərin xəritəsi

**Mənbə:** Quiz-1 hazırlıq kitabı, səh. 3–6 · **Riyaziyyat:** [metrikalar](../02-math/03-probability-statistics/metrikalar.md)

## 🎯 Bir cümlədə
Süni intellekt **qaydalarını əvvəlcədən tam yazmaq mümkün olmayan** işləri görən sistemlər qurur. Müasir yanaşma **rasional agent** qurmaqdır.

## 📚 Əsas anlayışlar

| Termin | İzah |
|---|---|
| **Sİ (kursun tərifi)** | İnsan zəkası tələb edən və bütün qaydaları əvvəlcədən yazmaqla həll olunmayan tapşırıqları yerinə yetirən sistemlər |
| **Agent** | Mühiti **sensorlarla** qavrayır, ona **icra mexanizmləri** ilə təsir edir |
| **Rasional agent** | Gözlənilən nəticəni ən yaxşı edən hərəkəti seçir. Rasional olmaq hər şeyi bilmək demək deyil |
| **Dar Sİ (narrow AI)** | Bir işdə güclüdür (AlphaGo yalnız Go oynayır). **Bu gün bütün Sİ sistemləri dardır** |
| **Ümumi Sİ (AGI)** | İstənilən intellektual işi öyrənir. **Hələ yoxdur** |
| **Sİ effekti** | Maşın bir işi öyrənən kimi ona artıq «sadəcə proqram» deyirik (Larri Tesler) |

**Misal:** Əmək haqqı proqramı Sİ deyil, çünki bütün qaydalarını insan yazıb. Spam süzgəci isə Sİ-dir: spamın tam qaydasını heç kim yaza bilməz, maşın onu nümunələrdən özü tapır.

**Agentin dövrü:** qavrayış → qərar → təsir. Spam süzgəci məktubu oxuyur, «spamdır?» deyə qərar verir, sonra məktubu uyğun qovluğa köçürür.

### Rassel–Norviq: 4 yanaşma

|  | **İnsan kimi** | **Rasional** |
|---|---|---|
| **Təfəkkür** | A — insan kimi düşünmək (koqnitiv elm) | B — rasional düşünmək (məntiq) |
| **Davranış** | C — insan kimi davranmaq (Turinq testi) | **D — rasional davranmaq ← MÜASİR Sİ** |

## 🕰️ Tarix: üç dalğa, iki qış

```
1950–1974  1-ci dalğa   → 1950 Turinq · 1956 Dartmut · 1958 Perseptron · 1965 Qeyri-səlis məntiq · 1966 ELIZA
1974–1980  ❄ I QIŞ      → vədlər yerinə yetmədi, maliyyə kəsildi
1980–1987  2-ci dalğa   → ekspert sistemləri · 1986 geri yayılma
1987–1993  ❄ II QIŞ     → ekspert sistemləri kövrək və baha çıxdı
1993–...   3-cü dalğa   → 1997 Deep Blue · 2012 AlexNet · 2016 AlphaGo · 2017 Transformer · 2022 ChatGPT
```

- **Qışın səbəbləri:** vədlər çox böyük idi, **kombinator partlayış** baş verdi (kiçik məsələdə işləyən üsul milyardlarla variantda «boğulur»), ekspert sistemləri kövrək çıxdı, Minski–Peypertin «Perseptronlar» kitabı (1969) da təsir etdi.
- **2012-dən sonra nə dəyişdi?** Üç şey eyni vaxtda gəldi: **verilənlər** (internet), **GPU** (əslində video oyunlar üçün yaradılmışdı), **yeni üsullar**. İdeyaların özü köhnə idi: perseptron 1958-də yaranıb.
- Qarri Kasparov Bakıda doğulub. Deep Blue onu 1997-də uddu.

## 🗣️ Turinq testi və Çin otağı

- **Alan Turinq (1950)**, «Computing Machinery and Intelligence» (*Mind* jurnalı): «Maşınlar düşünə bilərmi?» sualını **imitasiya oyunu** ilə əvəz etdi.
- Hakim iştirakçılarla **yalnız yazılı** yazışır: onları görmür, səslərini eşitmir.
- **2025:** GPT-4.5 hakimlərin **73%**-ni aldatdı (Cons və Bergen). ELIZA 23%, GPT-4o isə 21% göstərdi.
- **CAPTCHA (2003)** tərs Turinq testidir: burada hakim maşındır.
- **Çin otağı (Con Sörl, 1980):** sintaksis (forma) semantika (məna) deyil. Proqramı icra etmək anlamaq demək deyil.
  - **Güclü Sİ** iddiası (düzgün proqram ağlın özüdür): Sörl bunu **rədd edir**.
  - **Zəif Sİ** iddiası (proqram ağlın faydalı modelidir): Sörl bununla **razılaşır**.

## 🧠 Maşın öyrənməsi

**İç-içə qutular:** `Generativ Sİ ⊂ Dərin öyrənmə ⊂ Maşın öyrənməsi ⊂ Sİ`. Bu əlaqə yalnız bir istiqamətdə işləyir: qaydalarla işləyən ekspert sistemi Sİ-dir, amma maşın öyrənməsi deyil.

- Klassik proqramda **qaydaları insan yazır**. Maşın öyrənməsində isə maşın qaydaları **verilənlərdən və düzgün cavablardan** özü çıxarır. Öyrənilmiş qaydaların adı **model**dir.
- Modeli yeni verilənlərə tətbiq etməyə **inference** deyilir. **Nümunə** cədvəlin bir sətridir, **əlamət (feature)** ölçülən xüsusiyyətdir, **etiket (label)** isə düzgün cavabdır.

| Paradiqma | Siqnal | Tapşırıqlar | Öncüllər |
|---|---|---|---|
| **Nəzarətli** | etiket var («cavab kitabçası») | təsnifat, reqressiya | Rozenblatt, Vapnik |
| **Nəzarətsiz** | etiket yoxdur | klasterləşmə, ölçünün azaldılması | Pirson, Lloyd |
| **Gücləndirilmiş** | mükafat və cəza («isti–soyuq») | oyunlar, robotlar | Satton və Barto (Turinq 2024) |
| **Özünə nəzarətli** | etiketi mətnin özü verir | növbəti söz | dil modelləri |

**Layihənin 6 mərhələsi:** problem → verilənləri toplamaq → təmizləmək → öyrətmək → qiymətləndirmək → tətbiq və monitorinq. Model zamanla pisləşir: buna **model drift** deyilir.

### Modellərin xəritəsi
| Tapşırıq | Sual | Modellər |
|---|---|---|
| Reqressiya | Nə qədər? | xətti reqressiya, qərar ağacı, qradiyent bustinq |
| Təsnifat | Hansı sinif? | logistik reqressiya, k-NN, SVM, sadəlövh Bayes |
| Klasterləşmə | Hansı qruplar var? | k-means, DBSCAN |
| Ölçünün azaldılması | Əsas nədir? | PCA, t-SNE, UMAP |
| Ardıcıllıq | Sonra nə gəlir? | RNN, LSTM, Transformer |
| Qərar qəbulu | Nə etməli? | Q-learning (gücləndirilmiş öyrənmə) |

**Praktik qayda:** cədvəl verilənləri üçün **qradiyent bustinq**, şəkil, səs və mətn üçün **dərin öyrənmə** seçilir.

## 📏 Qiymətləndirmə
- **Qızıl qayda:** modeli öyrəndiyi verilənlərlə yoxlamırlar. Verilənlər üç hissəyə bölünür: **təlim** (çəkilər öyrənilir), **validasiya** (hiperparametrlər seçilir), **test** (ən sonda, yalnız bir dəfə). Verilən azdırsa, **k-qat çarpaz yoxlama** işlədilir.
- **Underfitting:** model çox sadədir, həm təlimdə, həm testdə səhv edir. **Overfitting:** model küyü də əzbərləyir, ona görə yeni verilənlərdə zəif işləyir. Qarşı tədbirlər: daha çox verilən, daha sadə model, requlyarlaşdırma, erkən dayandırma.
- **Metrikalar:** düzgünlük, dəqiqlik, tamlıq, F1. Ətraflı: [metrikalar.md](../02-math/03-probability-statistics/metrikalar.md).
- ⚠️ **Balanssız siniflər:** fırıldaq hallarının 1%-dirsə, hamısına «normal» deyən model də 99% düzgünlük alır, amma tamlığı 0 olur.

## 🌍 Sİ bu gün
- **Azərbaycanın Sİ Strategiyası (2025–2028):** 19 mart 2025-ci il tarixli sərəncamla təsdiq edilib. 4 istiqaməti var: idarəetmə (etika, hüquq), məlumat və infrastruktur, istedad (Süni İntellekt Akademiyası), biznes mühiti.
- **4 risk:** qərəz, izah olunmama, məxfilik, halüsinasiya.
- Hər model haqqında 3 sual: nəyi bacarır, nə qədər yaxşı bacarır, harada **səssizcə** yanılır?

## ❓ İmtahan sualları
1. Spam süzgəci niyə Sİ-dir, əmək haqqı proqramı isə niyə deyil?
2. İki Sİ qışının illərini və səbəblərini yazın.
3. Çin otağı arqumenti nəyi göstərir? Güclü Sİ ilə zəif Sİ arasındakı fərq nədir?
4. Nəzarətli, nəzarətsiz və gücləndirilmiş öyrənmənin hər birinə bir nümunə yazın.
5. 99% düzgünlük niyə aldadıcı ola bilər?

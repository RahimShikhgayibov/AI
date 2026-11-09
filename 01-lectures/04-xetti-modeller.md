# Mühazirə 4 — Xətti modellər: reqressiya və təsnifat

**Mənbə:** Quiz-1 hazırlıq kitabı, səh. 14–16 · **Riyaziyyat:** [ƏKK və requlyarlaşdırma](../02-math/04-optimization/xetti-reqressiya-ve-requlyarlasdirma.md), [logistik və softmax](../02-math/03-probability-statistics/logistik-ve-softmax.md)

## 🎯 Bir cümlədə
Bu mühazirədəki bütün modellərin nüvəsi eynidir: **çəkili cəm** $z = w_0 + w_1x_1 + \dots + w_dx_d$. Reqressiya bu cəmi olduğu kimi qaytarır. Logistik reqressiya onu sigmoiddən, softmax reqressiya isə softmax-dan keçirir.

## 🕰️ Tarix
- **1801, Ceres:** Piatsi yeni səma cismini gördü, sonra onu itirdi. 24 yaşlı Qauss orbiti hesabladı və Ceres hesablanan yerdə tapıldı.
- **Lejandr (1805)** ən kiçik kvadratlar üsulunu ilk dəfə dərc etdi və ona ad verdi. **Qauss (1809)** onu əsaslandırdı və 1795-dən işlətdiyini yazdı.
- **Qalton (1886)** «ortaya reqressiya» ifadəsini işlətdi: uca valideynlərin övladları da uca olur, amma ortaya daha yaxın olur. «Reqressiya» sözü buradan gəlir.
- **Niyə hələ də xətti modellər?** Kaggle 2020 sorğusunda mütəxəssislərin 59%-i bu modelləri işlədirdi və onlar birinci yerdə idi. Səbəblər: izah olunur, sürətlidir, hər neyron şəbəkəsinin son qatı xəttidir, digər modellər üçün baza rolunu oynayır.

## 📈 Xətti reqressiya
- $\hat y = w_0 + w_1 x_1 + \dots$. Burada $w_0$ sərbəst hədd, $w_j$ isə **əmsaldır**. **Əmsal əlaqəni göstərir, səbəbi yox.**
- **Qalıq:** $e = y - \hat y$.
- **ƏKK** qalıqların kvadratları cəmini kiçildir. Kvadrat ona görə seçilir ki, həll düsturla tapılsın (normal tənliklər $X^\top X w = X^\top y$), böyük xətalar daha çox cərimələnsin və xətalar normal paylananda nəticə ən ehtimallı olsun.
- $R^2 = 1 - SSE/SST$ modelin izah etdiyi dəyişkənliyin payıdır.
- **Anskomb kvarteti (1973):** dörd verilən dəstinin statistikaları eynidir, amma qrafikləri tamam fərqlidir. Ona görə **əvvəlcə qrafikə baxmaq** lazımdır.
- **Huber itkisi (1964)** kənar nöqtələrə qarşı dözümlüdür.

## 🌀 Xətti model əyri də çəkə bilər
- Modelin «xətti» olması **parametrlərə** görədir, əlamətlərə görə yox. $x^2$, $\log x$, $\sin x$, one-hot kimi əlamətlər əlavə etsək də, model yenə xətti qalır.
- **Polinomun dərəcəsi:** 1-ci dərəcə az uyğunlaşır, 3-cü dərəcə uyğun gəlir, 11-ci dərəcə isə həddən artıq uyğunlaşır və əmsalları nəhəng olur. Dərəcə validasiya verilənlərinə görə seçilir.
- **Multikollinearlıq:** iki əlamət eyni şeyi ölçəndə (məsələn, sm və düym) əmsallar qeyri-sabit olur. Həll yolu: əlamətlərdən birini çıxarmaq və ya Ridge işlətmək.

## 🛡️ Requlyarlaşdırma: itki + λ·cərimə
| | Ridge (L2) | Lasso (L1) | Elastic Net |
|---|---|---|---|
| Cərimə | $\lambda \lVert w\rVert_2^2$ | $\lambda \lVert w\rVert_1$ | ikisi birlikdə |
| Düsturla həll | ✅ $(X^\top X + \lambda I)^{-1}X^\top y$ | ❌ (koordinat enişi, LARS) | ❌ |
| Əmsallar | kiçilir, amma **sıfır olmur** | bəziləri **dəqiq sıfır olur**, yəni model əlamət seçir | seçir və sabit saxlayır |
| Həndəsi forma | dairə | **romb** (künclər oxların üstündədir) | — |
| Bayes baxışı | Qauss aprioru | Laplas aprioru | — |
| Kim, nə vaxt | Tixonov · Hörl və Kennard 1970 | Tibşirani 1996 | Zou və Hasti 2005 |

λ çarpaz yoxlama ilə seçilir. Əlamətlər əvvəlcə standartlaşdırılır, sərbəst hədd isə cərimələnmir. Neyron şəbəkələrdə L2 cəriməsinə **«çəki azalması»** deyilir.

## 🔀 Logistik reqressiya (təsnifat modelidir!)
- Adi xətti reqressiya təsnifat üçün yaramır, çünki proqnozu [0, 1] aralığından çıxır. Həll: cəmi sigmoiddən keçirmək, $p = \sigma(w^\top x + b)$.
- $\sigma(0)=0{,}5$, $\sigma(2)\approx 0{,}88$, $\sigma(-2)\approx 0{,}12$. $z > 0 \Leftrightarrow p > 0{,}5$ olduğu üçün **qərar sərhədi düz xəttdir**.
- 0,5 həddi məcburi deyil. Xəstəni buraxmaq bahadırsa, həddi aşağı salırıq.
- **Şans:** $p/(1-p)$. Model log-şansı xətti edir. Əlamət 1 vahid artanda şans $e^w$ dəfə dəyişir.
- **İtki:** çarpaz entropiya (log-loss).
- **Tarix:** Verhülst (1838, logistik əyri) · Berkson («logit» sözü, 1944) · **Devid Koks (1958)**.
- **Tətbiqləri:** futbolda xG, Elo reytinqi, bankların kredit bal kartları (qərar izah olunmalıdır).

## 🎲 Softmax və GLM
- **Softmax** K sinif üçündür. Hər loqitin eksponenti götürülüb cəmə bölünür, nəticədə ehtimalların cəmi 1 olur. K = 2 olanda softmax sigmoidə çevrilir.
- **Temperatur T:** kiçik T paylanmanı kəskinləşdirir (kod, riyaziyyat üçün), böyük T isə hamarlayır (yaradıcı mətn üçün). Siniflərin sırası dəyişmir.
- **Hər böyük dil modelinin son qatı softmax reqressiyadır.** Siniflər lüğətdəki tokenlərdir.
- **İris (Fişer, 1936):** 150 çiçək, 3 növ, 4 ölçü. Model $3\cdot(4+1) = 15$ parametrlə 97,3% nəticə verir.

| Hədəf | Paylanma | Əlaqə funksiyası | Model |
|---|---|---|---|
| ədəd | normal | $\mu$ | xətti reqressiya |
| 0/1 | Bernulli | logit | logistik |
| K sinif | kateqorial | softmax | softmax reqressiya |
| say | **Puasson** | $\ln \mu$ | Puasson reqressiyası (zənglər, qollar) |
| müsbət məbləğ | **Qamma** | $\ln \mu$ | Qamma reqressiyası (sığorta) |

**GLM:** Nelder və Uedderbern (1972).

## ❓ İmtahan sualları
1. Ridge ilə Lasso arasındakı fərq nədir? Lasso niyə əmsalları sıfıra endirə bilir?
2. Logistik reqressiya reqressiya modelidir, yoxsa təsnifat modeli? Cavabınızı izah edin.
3. $y = w_0 + w_1 x^2$ xətti modeldirmi?
4. Şans 2 dəfə artarsa, ehtimal da 2 dəfə artırmı?
5. Zənglərin sayını proqnozlaşdırmaq üçün hansı GLM işlədilir?

# Mühazirə 5 — Ehtimal modelləri və qeyri-müəyyənlik

**Mənbə:** Quiz-1 hazırlıq kitabı, səh. 17–19 · **Riyaziyyat:** [Bayes və qərar](../02-math/03-probability-statistics/bayes-ve-qerar.md), [qeyri-səlis məntiq](../02-math/05-discrete-math-logic/qeyri-selis-mentiq.md)

## 🎯 Bir cümlədə
Bayes teoremi inamımızı yeni sübuta görə yeniləyir. Qərar isə **həm ehtimaldan, həm səhvlərin qiymətindən** asılıdır.

## 🔄 Bayes teoremi
$$P(H \mid E) = \frac{P(E \mid H)\,P(H)}{P(E)}$$

| Hissə | Adı | Nümunə |
|---|---|---|
| $P(H)$ | aprior (sübutdan əvvəlki inam) | 1% |
| $P(E \mid H)$ | həqiqətəbənzərlik (testin həssaslığı) | 90% |
| $P(E)$ | sübutun ehtimalı | 0,098 |
| $P(H \mid E)$ | aposterior (sübutdan sonrakı inam) | **≈ 9%** |

- **2007-də aparılan sorğuda** ginekoloqların cəmi **21%-i** bu suala düzgün cavab verdi, çoxu «90%» dedi. **Gerd Gigerenzer** göstərdi ki, sual təbii tezliklərlə («1000 nəfərdən 10-u») verildikdə düzgün cavabların payı **87%-ə** qalxır.
- **Əsas səhv:** $P(\text{müsbət} \mid \text{xəstə})$ ilə $P(\text{xəstə} \mid \text{müsbət})$ eyni şey deyil!
- **Tarix:** Tomas Bayesin qeydlərini 1763-də dostu **Prays** dərc etdi. **Laplas (1774)** ideyanı hesablama alətinə çevirdi. **Turinq** Enigma şifrəsini açarkən dəlilin çəkisini ban və desiban vahidləri ilə ölçürdü. **AF447** təyyarəsinin qalıqları Bayes xəritəsi sayəsində bir həftəyə tapıldı.

## ⚖️ Qərar və risk
- **Bayes qərar qaydası:** ən ehtimallı sinfi seçmək. Bu qayda ilə əldə edilən minimal xətaya **Bayes xətası** deyilir. Eyni əlamətlərlə heç bir model ondan az səhv edə bilməz.
- Səhvlərin qiyməti fərqlidirsə, **minimal risk** prinsipi işlədilir. Model «müsbət» deyir, əgər $P(\text{müsbət}\mid x) > \dfrac{c_{FP}}{c_{FP}+c_{FN}}$ (Abraham Vald, 1950).
- **Eşiyi ehtimal yox, səhvlərin qiyməti seçir:** spam üçün 0,9, xərçəng skrininqi üçün 0,05, kart fırıldağı üçün 0,2.
- **«Bilmirəm» seçimi (Çou):** model əmin deyilsə, qərarı insana ötürmək də bir qərardır.

## 🧩 Generativ və diskriminativ modellər
| Generativ | Diskriminativ |
|---|---|
| $p(x\mid y)$ və $P(y)$ öyrənilir, Bayes teoremi tətbiq olunur | $P(y\mid x)$ birbaşa öyrənilir |
| «Hər sinif necə görünür?» | «Sinifləri nə ayırır?» |
| sadəlövh Bayes, LDA, QDA | logistik reqressiya, SVM, qərar ağacı, neyron şəbəkələr |
| az verilənlə daha tez öyrənir (Nq və Cordan, 2001) | — |

- **Sadəlövh Bayes:** sinif məlum olduqda sözlər bir-birindən asılı sayılır ki, sayılmır. Buna «sadəlövh fərziyyə» deyilir. Ehtimal belə hesablanır: $P(y\mid x) \propto P(y)\prod P(x_i\mid y)$. Bu modelin qərarı söz-söz izah olunur.
- **Spam süzgəclərinin tarixi:** 1998 Microsoft Research, 2002 Pol Qremin «A Plan for Spam» məqaləsi, 2017 Gmail (99,9%-dən çox).
- **LDA:** bütün siniflərin forması eynidir, sərhəd **düz xətt** olur. **QDA:** hər sinfin öz forması var, sərhəd **əyri** olur. İdeya Fişerə məxsusdur (1936). Müasir nümunə: Palmer pinqvinləri, LDA ilə 98,8%.

## 🎯 MLE və MAP
- **MLE (Fişer, 1922)** yalnız verilənlərə baxır: $\theta = k/n$. 3 atışda 3 gerb gəlsə, MLE $\theta = 1$ verir, yəni sikkə heç vaxt yazı düşməyəcək. Bu açıq-aşkar səhvdir.
- **MAP** aprioru həqiqətəbənzərliyə vurur. Rəylər çoxaldıqca aprior təsirini itirir.
- **Aprior requlyarlaşdırmanın özüdür:** Qauss aprioru Ridge verir, Laplas aprioru Lasso, Beta aprioru isə Laplas hamarlaması.
- **Laplas qaydası (1814):** $(k+1)/(n+2)$. Bu qayda sıfır ehtimalın qarşısını alır, çünki bir sıfır bütün hasili sıfıra çevirir.

## 🕸️ Bayes şəbəkələri (Cudia Perl, 1988, Turinq 2011)
- Ox «**birbaşa təsir edir**» deməkdir. Hər düyün yalnız öz valideynlərindən asılıdır. Nümunədə 5 dəyişənin tam cədvəli 31 ədəd tələb edir, şəbəkə isə cəmi 10.
- **Siqnalizasiya nümunəsi:** siqnal işləyib, oğru ehtimalı 0,374-dür. Zəlzələ xəbəri gələndən sonra bu ehtimal 0,003-ə düşür. Buna **izah edilib aradan qalxma** deyilir.
- **Perlin səbəbiyyət nərdivanı:** ① görmək (korrelyasiya) → ② etmək (müdaxilə) → ③ təsəvvür etmək (kontrfaktik). **Korrelyasiya səbəb deyil.**
- **Simpson paradoksu (böyrək daşları, 1986):** hər qrupda A üsulu daha yaxşıdır, cəmdə isə B yaxşı görünür. Səbəb qarışdırıcı dəyişəndir (daşın ölçüsü).

## 🌫️ Qeyri-səlis məntiq (Lütfi Zadə)
- **Lütfi Zadə** 4 fevral 1921-də Bakıda doğulub, 1959-dan Berklidə işləyib. 1965-də «Fuzzy Sets» məqaləsini dərc edib, 2017-də vəfat edib və Fəxri xiyabanda dəfn olunub.
- **Üzvlük funksiyası** $\mu$ hər elementə 0 ilə 1 arasında aidiyyət dərəcəsi verir.
- **Mamdani (1975):** sözlə yazılmış qaydalarla maşını idarə etmək. **Sendai metrosu (1987, Hitachi)** bu yolla ~10% enerjiyə qənaət etdi.
- ⚠️ **Dərəcə ehtimal deyil!** $\mu_{isti} = 0{,}4$ «bir az isti» deməkdir, «40% ehtimalla isti» demək deyil. Dərəcələrin cəmi 1 olmaq məcburiyyətində deyil.

## 🌦️ Qeyri-müəyyənliyin növləri
| Aleatorik (*alea*, «zər») | Epistemik (*episteme*, «bilik») |
|---|---|
| verilənin özündəki təsadüf, küy | modelin bilgisizliyi |
| yeni verilən onu **azaltmır** | yeni verilən onu **azaldır** |

- **Kalibrləmə:** model «90% əminəm» deyirsə, belə hallarda ~90% düz çıxmalıdır. Sadəlövh Bayes adətən həddən artıq əmin olur. Düzəliş üsulu: temperatur miqyaslaması.
- **Konformal proqnoz (Vovk, 2005):** model tək cavab əvəzinə cavab çoxluğu və zəmanət verir.
- **Dil modelləri niyə uydurur?** Testlərdə «bilmirəm» cavabı 0 bal alır, ona görə model təxmin etməyə öyrəşir (OpenAI, 2025).

## ❓ İmtahan sualları
1. Testin həssaslığı 90%-dir. Müsbət nəticə nə üçün 90% xəstəlik demək deyil?
2. Spam süzgəcində eşik niyə 0,5 yox, 0,9 seçilir?
3. MLE ilə MAP arasındakı fərq nədir? Laplas hamarlaması nəyə lazımdır?
4. Üzvlük dərəcəsi ilə ehtimal arasındakı fərqi nümunə ilə izah edin.
5. Aleatorik və epistemik qeyri-müəyyənlik arasındakı fərq nədir?

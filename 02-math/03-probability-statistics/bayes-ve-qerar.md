# Bayes teoremi, qərar eşiyi, MLE/MAP və Laplas hamarlaması

> Quiz-1 · E hissəsi · [Mühazirə 5](../../01-lectures/05-ehtimal-modelleri.md)

## 1. İntuisiya
Nadir bir xəstəlik üçün test müsbət çıxıb. İnsanın ilk reaksiyası belədir: «test 90% dəqiqdir, deməli 90% xəstəyəm». **Bu yanlışdır.** Sağlam insanlar çox olduğu üçün testin onlara verdiyi kiçik faizli səhvlər, həqiqi xəstələrin sayından çox olur.

**Qızıl qayda:** faizləri insan sayına çevirin. 1000 nəfərlik bir qrup təsəvvür edin.

## 2. Düsturlar
$$P(H\mid E) = \frac{P(E\mid H)\,P(H)}{P(E)}, \qquad P(E) = P(E\mid H)P(H) + P(E\mid \neg H)P(\neg H)$$

**1000 nəfər üsulu:** $P(\text{xəstə}\mid +) = \dfrac{\text{xəstə müsbətlər}}{\text{bütün müsbətlər}}$

**Şans forması:** aposterior şans = aprior şans × $\dfrac{P(E\mid H)}{P(E\mid\neg H)}$

**Qərar eşiyi (minimal risk):** model «müsbət» deyir, əgər
$$P(\text{müsbət}\mid x) > \frac{c_{FP}}{c_{FP} + c_{FN}}$$
Səhvlərin qiyməti bərabərdirsə ($c_{FP} = c_{FN}$), eşik **0,5** olur.

**MLE:** $\hat\theta = k/n$ · **Laplas qaydası:** $\dfrac{k+1}{n+2}$

## 3. Əl ilə həll edilmiş misallar

**Misal 1 — klassik məsələ:** xəstəliyin yayılması 1%, testin həssaslığı 90%, yalançı müsbət payı 9%.

| | Test + | Test − | Cəmi |
|---|---|---|---|
| Xəstə | **9** | 1 | 10 |
| Sağlam | **≈ 89** | 901 | 990 |
| Cəmi | **98** | 902 | 1000 |

$P(\text{xəstə}\mid +) = 9/98 \approx$ **0,09**. Ehtimal təxminən 9%-dir, 90% yox!

Eyni hesab şans forması ilə: aprior şans $1:99$, nisbət $0{,}9/0{,}09 = 10$. Aposterior şans $10:99$, yəni ehtimal $10/109 \approx 0{,}09$ ✓

**Misal 2 — eşik:**
| Vəziyyət | $c_{FP}$ : $c_{FN}$ | Eşik |
|---|---|---|
| Spam: adi məktubu itirmək 9 dəfə pisdir | 9 : 1 | $9/10 = $ **0,9** |
| Xərçəng: xəstəni buraxmaq 19 dəfə pisdir | 1 : 19 | $1/20 = $ **0,05** |
| Fırıldaq: buraxmaq 4 dəfə pisdir | 1 : 4 | $1/5 = $ **0,2** |

**Necə yadda saxlamalı:** yalançı müsbət (FP) bahadırsa, eşik yüksək olur, model «müsbət» deməkdə ehtiyatlı davranır. Buraxılmış müsbət (FN) bahadırsa, eşik aşağı olur, model həssas olur.

**Misal 3 — Laplas hamarlaması:** «prize» sözü 8 adi mesajda heç vaxt keçməyib.
- MLE: $0/8 = 0$. Bu sıfır sadəlövh Bayesdə **bütün hasili sıfıra** çevirir!
- Laplas: $(0+1)/(8+2) = $ **0,1**. Kiçikdir, amma sıfır deyil.

## 4. Python ilə yoxlama
```python
def bayes_1000(prev, sens, fpr, N=1000):
    sick = N * prev
    tp = sick * sens
    fp = (N - sick) * fpr
    return tp, fp, tp + fp, tp / (tp + fp)

print(bayes_1000(0.01, 0.90, 0.09))   # (9.0, 89.1, 98.1, 0.0917)
print(bayes_1000(0.02, 0.80, 0.05))   # (16.0, 49.0, 65.0, 0.246)

threshold = lambda c_fp, c_fn: c_fp / (c_fp + c_fn)
laplace = lambda k, n: (k + 1) / (n + 2)
print(threshold(9, 1), threshold(1, 19), laplace(3, 3))   # 0.9 0.05 0.8
```

## 5. AI-da harada istifadə olunur?
- **Sadəlövh Bayes** spam süzgəcləri bu prinsiplə işləyir: $P(y\mid x) \propto P(y)\prod P(x_i\mid y)$.
- Tibbi diaqnoz və skrininq sistemlərində eşik səhvlərin qiymətinə görə seçilir.
- **Aprior requlyarlaşdırmanın özüdür:** Qauss aprioru Ridge, Laplas aprioru Lasso, Beta aprioru isə Laplas hamarlaması verir.

## 6. Tapşırıqlar
1. 1000 nəfərdən 20-si xəstədir. Test 18 xəstəni tapır, sağlamlardan da 49-u müsbət çıxır. Müsbət nəticəsi olan adamın xəstə olma ehtimalı nədir?
2. 1000 nəfərdən 20-si xəstədir. Test xəstələrin 80%-ni tapır, sağlamların 5%-nə səhvən «müsbət» deyir. Neçə müsbət nəticə alınır və ehtimal nədir?
3. Xəstəliyin yayılması 5%, həssaslıq 90%, yalançı müsbət payı 10%-dir. $P(\text{xəstə}\mid +)$ nədir?
4. $c_{FP} = 1$, $c_{FN} = 3$. Eşik nədir?
5. 3 atışda 3 gerb gəlib. MLE və Laplas qaydası nə verir?
6. 10 atışda 7 gerb gəlib. MLE və Laplas qaydası nə verir?

<details><summary>Cavablar</summary>

1. $18 + 49 = 67$ müsbət, $18/67 \approx$ **0,27**
2. Xəstə müsbətlər: $20\cdot0{,}8 = 16$. Sağlamlar: 980, onların 5%-i 49 yalançı müsbətdir. Cəmi **65** müsbət, $16/65 \approx$ **0,25**
3. Xəstələr 50, onlardan 45-i müsbət. Sağlamlar 950, onlardan 95-i müsbət. $45/140 \approx$ **0,32**
4. $1/(1+3) = $ **0,25**
5. MLE $3/3 = $ **1**, Laplas $4/5 = $ **0,8**
6. MLE **0,7**, Laplas $8/12 \approx$ **0,67**

</details>

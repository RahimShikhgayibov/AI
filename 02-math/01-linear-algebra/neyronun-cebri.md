# Neyronun cəbri: çəkili cəm, parametrlər, konvolyusiya

> Quiz-1 · E hissəsi · Mühazirə [2](../../01-lectures/02-neyron-sebekeler.md) və [3](../../01-lectures/03-arxitekturalar.md)

## 1. İntuisiya
Neyron **skalyar hasil** hesablayır: girişlər vektorunu çəkilər vektoruna vurub toplayır, sonra sürüşməni ($b$) əlavə edir. Çəki böyükdürsə, o giriş qərara güclü təsir edir. Çəki mənfidirsə, giriş qərarın əleyhinə «səs verir».

## 2. Düsturlar

**Bir neyron:**
$$z = w \cdot x + b = \sum_{i} w_i x_i + b, \qquad \hat y = f(z)$$

| Aktivasiya | $f(z)$ |
|---|---|
| pilləli | $z \ge 0 \Rightarrow 1$, yoxsa 0 |
| ReLU | $\max(0, z)$ |
| sigmoid | $1/(1+e^{-z})$; $\sigma(0)=0{,}5$, $z>0 \Rightarrow \sigma(z) > 0{,}5$ |

**Tam əlaqəli qat** ($n$ giriş, $m$ neyron): matris şəklində $z = Wx + b$, burada $W$ ölçüsü $m \times n$ olan matrisdir.
$$\text{parametrlər} = \underbrace{n \cdot m}_{\text{çəkilər}} + \underbrace{m}_{\text{sürüşmələr}}$$

**Konvolyusiyanın çıxış ölçüsü:**
$$\text{çıxış} = \left\lfloor \frac{W - k + 2p}{s} \right\rfloor + 1 \quad\xrightarrow{p=0,\ s=1}\quad W - k + 1$$
Burada $W$ giriş ölçüsü, $k$ filtr ölçüsü, $p$ kənar doldurma (padding), $s$ isə addımdır (stride). **2×2 pulinq** ölçünü yarıya endirir və **parametri yoxdur**.

**Konvolyusiya qatının parametrləri:** $(k \cdot k \cdot C_{giriş} + 1) \cdot F$. Burada $F$ filtrlərin sayı, +1 isə hər filtrin sürüşməsidir.

**Əlavə (kitabda var, imtahanda ehtimalı azdır):**
- RNN qatı: $m(d + m + 1)$. GRU-da bu ədəd 3 dəfə, LSTM-də 4 dəfə çox olur.
- Transformer: hər blokda ~$12d^2$, bütün modeldə $N \approx 12 L d^2$.
- ViT: $(224/16)^2 = 14^2 = 196$ token.

## 3. Əl ilə həll edilmiş misallar

**Misal 1 — neyronun çıxışı** (kitabdan): $x=(2,-1)$, $w=(0{,}5;\ 1)$, $b=0{,}5$
1. $z = 0{,}5\cdot2 + 1\cdot(-1) + 0{,}5 = 0{,}5$
2. pilləli: $z \ge 0$ olduğu üçün **1**
3. ReLU: $\max(0;\ 0{,}5) = $ **0,5**

**Misal 2 — MNIST şəbəkəsi** 784 → 128 → 10:
- $784\cdot128 + 128 = 100\,480$
- $128\cdot10 + 10 = 1\,290$
- cəmi **101 770** parametr

**Misal 3 — LeNet:** $W=32$, $k=5$ → $32-5+1 = 28$. Sonra 2×2 pulinq: 28 → **14**.

**Misal 4 — CNN qənaəti:** 224×224×3 şəkil 150 528 ədəddir. 1000 neyronlu tam əlaqəli qat **150 528 000** çəki tələb edir. 64 filtrli 3×3×3 konvolyusiya qatının isə $(27+1)\cdot 64 = $ **1 792** parametri var.

**Misal 5 — XOR-u gizli qatla həll etmək:**

| $x_1$ | $x_2$ | $h_1$ = VƏ YA | $h_2$ = VƏ | çıxış = $h_1$ VƏ (DEYİL $h_2$) |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | **0** |
| 0 | 1 | 1 | 0 | **1** |
| 1 | 0 | 1 | 0 | **1** |
| 1 | 1 | 1 | 1 | **0** |

Makkalok–Pitts neyronunda iki giriş üçün hədd 1 olanda VƏ YA, hədd 2 olanda VƏ alınır.

## 4. Python ilə yoxlama
```python
import numpy as np

x = np.array([2, -1]); w = np.array([0.5, 1.0]); b = 0.5
z = w @ x + b
print(z, int(z >= 0), max(0, z), 1 / (1 + np.exp(-z)))   # 0.5 1 0.5 0.62

def params(layers):              # [784, 128, 10]
    return sum(n * m + m for n, m in zip(layers, layers[1:]))
print(params([784, 128, 10]))    # 101770

conv = lambda W, k, p=0, s=1: (W - k + 2 * p) // s + 1
print(conv(32, 5), conv(28, 3))  # 28 26
```

## 5. AI-da harada istifadə olunur?
- Hər neyron şəbəkəsinin hər qatı $Wx + b$ hesablayır. GPU məhz bu matris vurmalarını sürətlə edir.
- Parametrlərin sayı modelin ölçüsünü göstərir: AlexNet 60 milyon, GPT-3 175 milyard parametrə malikdir.
- Konvolyusiyanın çıxış ölçüsünü bilmədən CNN arxitekturası qurmaq olmaz.

## 6. Tapşırıqlar
1. $x=(1,3)$, $w=(-1;\ 0{,}2)$, $b=0$. Cəm, pilləli çıxış və ReLU nədir?
2. $x=(2,3)$, $w=(1;\ -0{,}5)$, $b=-0{,}2$. Cəm, pilləli çıxış və ReLU nədir?
3. 3 → 4 → 2 şəbəkəsində neçə parametr var?
4. 10 → 5 → 3 şəbəkəsində neçə parametr var?
5. 28×28 şəkil, 3×3 filtr, $p=0$, $s=1$. Çıxış ölçüsü nədir?
6. 32×32 şəkil, 3×3 filtr, $p=1$, $s=1$. Çıxış ölçüsü nədir?
7. 32 filtrli, 5×5 ölçülü konvolyusiya qatı ağ-qara (1 kanallı) şəkil üzərində işləyir. Neçə parametri var?

<details><summary>Cavablar</summary>

1. $z = -1 + 0{,}6 + 0 = -0{,}4$, pilləli **0**, ReLU **0**
2. $z = 2 - 1{,}5 - 0{,}2 = 0{,}3$, pilləli **1**, ReLU **0,3**
3. $3\cdot4+4 = 16$, $4\cdot2+2 = 10$, cəmi **26**
4. $10\cdot5+5 = 55$, $5\cdot3+3 = 18$, cəmi **73**
5. $28-3+1 = $ **26×26**
6. $(32-3+2)/1+1 = $ **32×32** (padding ölçünü qoruyur)
7. $(5\cdot5\cdot1+1)\cdot32 = 26\cdot32 = $ **832**

</details>

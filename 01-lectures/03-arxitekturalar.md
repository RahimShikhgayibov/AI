# Mühazirə 3 — Dərin şəbəkələrin arxitekturaları və müasir modellər

**Mənbə:** Quiz-1 hazırlıq kitabı, səh. 10–13 · **Riyaziyyat:** [neyronun cəbri: CNN, RNN, Transformer hesabları](../02-math/01-linear-algebra/neyronun-cebri.md)

## 🎯 Bir cümlədə
Arxitekturalar neyronlarına görə yox, **bağlantı sxeminə** görə fərqlənir. Arxitekturanı seçmək verilənlər haqqında bir fərziyyə qəbul etmək deməkdir. Buna **induktiv meyl** deyilir.

## 🗺️ Altı ailə

| Ailə | Fərziyyə | Verilən | Əsas illər |
|---|---|---|---|
| **CNN** | yaxın piksellər bir-biri ilə əlaqəlidir | şəkil, video | 1980 neokoqnitron · 1989 LeNet · 2012 AlexNet · 2015 ResNet |
| **RNN** | sıra vacibdir | ardıcıllıq, zaman | 1990 Elman · 1997 LSTM · 2014 GRU |
| **Transformer** | az fərziyyə qəbul edir, əlaqələri verilənlərdən özü öyrənir | mətn, istənilən token | 2014 diqqət · 2017 Transformer · 2018 BERT, GPT · 2020 ViT |
| **Generativ** | — | yeni nümunə yaratmaq | 2006 avtokoder · 2013 VAE · 2014 GAN · 2020 diffuziya |
| **GNN** | qonşuluq vacibdir | qraf (molekul, yol) | 2009 GNN · 2017 GCN · 2020 Google Maps |
| **Enerji əsaslı** | — | yaddaş | 1982 Hopfild · 1985 Boltsman maşını · 2006 DBN |

Transformer az fərziyyə qəbul edir, ona görə çevikdir, amma **çox verilən tələb edir**. Düzgün fərziyyə seçilərsə, model daha az verilənlə daha yaxşı öyrənir.

**Şəbəkəni 4 sualla təsnif etmək olar:** bağlantı sxemi, nəyi modelləşdirdiyi (diskriminativ və ya generativ), öyrənmə siqnalı, verilən növü. Məsələn, **GPT** diqqət şəbəkəsidir, generativdir, özünə nəzarətli öyrədilir və mətnlə işləyir.

## 🖼️ CNN: konvolyusiya şəbəkələri
- **İki əsas fikir:** **lokal bağlantı** (neyron kiçik bir pəncərəyə baxır) və **paylaşılan çəkilər** (eyni filtr bütün şəkildə işləyir).
- Filtr şəkil üzərində sürüşür və **əlamət xəritəsi** yaradır. Filtrdəki ədədləri şəbəkə özü öyrənir.
- **Pulinq (pooling)** xəritəni kiçildir: 2×2 pəncərədən maksimum və ya orta qiymət götürülür. **Pulinqin parametri yoxdur.**
- Tipik ardıcıllıq: konvolyusiya + ReLU → pulinq → … → tam əlaqəli qat → sinif.
- **Qənaət:** 224×224×3 ölçülü şəkil üçün tam əlaqəli qat **150 528 000** çəki tələb edir. 64 filtrli 3×3 konvolyusiya qatına isə cəmi **1 792** parametr lazımdır, yəni ~84 000 dəfə az.
- **ResNet (Kayminq He, 2015):** 152 qatdan ibarətdir. Problem belə idi: 56 qatlı şəbəkə 20 qatlıdan pis öyrənirdi. Həll **qalıq əlaqədir**: $y = F(x) + x$. Bu qısa yol Transformerdə də işlədilir.
- **3 tapşırıq:** təsnifat (ResNet, ViT), aşkarlama (YOLO, 2016), seqmentasiya (U-Net, 2015, tibbi şəkillər üçün).

## 🔁 RNN, LSTM, GRU
- $h_t = \tanh(W x_t + U h_{t-1} + b)$. Burada $h_t$ gizli vəziyyətdir, yəni indiyə qədər oxunanların xülasəsi. CNN çəkiləri **məkanda**, RNN isə **zamanda** paylaşır.
- **Problem:** qradiyent sönür ($0{,}9^{50} \approx 0{,}005$) və ya partlayır. Nəticədə şəbəkə cümlənin əvvəlini «unudur».
- **LSTM (Hoxrayter, Şmidhuber, 1997):** yaddaş xətti və **üç qapı** var: unutma, yazma, çıxış.
- **GRU (Kyunqhyun Ço, 2014):** **iki qapı** var, ayrıca yaddaş xətti yoxdur, ona görə daha yüngüldür.
- **Seq2seq (Sutskever, 2014):** koder bütün cümləni bir vektora sıxır. Uzun cümlə bir vektora sığmır. Bunun həlli **diqqət mexanizmidir** (Bahdanau, Ço, Bencio, 2014).

## ⚡ Transformer (Vasvani və həmmüəllifləri, Google, 2017, «Attention Is All You Need»)

$$\text{Attention}(Q,K,V) = \text{softmax}\left(\frac{QK^\top}{\sqrt d}\right) V$$

Q **sorğudur** («nə axtarıram?»), K **açardır** («məndə nə var?»), V **dəyərdir** (ötürülən məlumat).

- **Niyə inqilab oldu?** Bütün cümlə **paralel** emal olunur, bu da GPU üçün idealdır. Uzaq sözlər bir-birinə birbaşa bağlanır.
- **Çoxbaşlı diqqət:** bir neçə baş paralel işləyir. **Mövqe kodlaşdırması** lazımdır, çünki diqqət mexanizmi sözlərin sırasını özü görmür.
- **Blok** belə qurulur: diqqət + FFN + qalıq əlaqə + normallaşdırma. GPT-3-də 96 blok var.
- **Zəif cəhəti:** hesablama həcmi uzunluğun kvadratı ilə ($n^2$) artır.
- **ViT (Dosovitski, 2020):** şəkil 16×16 hissələrə bölünür. Məsələn, 224×224 şəkil 196 tokenə çevrilir.

| | BERT (2018) | GPT (2018-dən) | T5, Whisper |
|---|---|---|---|
| Quruluş | yalnız koder | yalnız dekoder | koder–dekoder |
| Baxış | iki tərəfli | yalnız keçmişə (səbəbi maska) | çarpaz diqqət |
| Təlim | gizlədilmiş sözü tapmaq | növbəti tokeni tapmaq | — |
| İşi | təsnifat, axtarış | çat, kod | tərcümə, nitqdən mətnə |

**Ölçü qaydası:** modeldəki parametrlərin sayı təxminən $N \approx 12 \cdot L \cdot d^2$-dir. GPT-3 üçün: L = 96, d = 12 288, nəticədə ~175 milyard.

## 🎨 Generativ modellər
**Diskriminativ** model girişə görə cavabı proqnozlaşdırır. **Generativ** model isə verilənlərin paylanmasını öyrənir və **yeni nümunə yaradır**.

| Model | İdeya | Kim, nə vaxt |
|---|---|---|
| Avtokoder, VAE | girişi dar boğazdan keçirib sıxır və bərpa edir. VAE kodu paylanma kimi saxlayır | 2006 · Kinqma, Vellinq 2013 |
| **GAN** | **iki şəbəkə** yarışır: generator saxta nümunə düzəldir, diskriminator onu tutmağa çalışır | İan Qudfellou 2014 |
| Diffuziya | şəklə küy qatılır, şəbəkə küyü proqnozlaşdırmağı öyrənir. Yeni şəkil yaratmaq üçün küy addım-addım silinir | Conatan Ho (DDPM) 2020 |

- **GNN:** hər düyün qonşularından mesaj toplayır (GCN: Kipf və Vellinq, 2017). Tətbiqləri: Google Maps, GraphCast, Halisin antibiotiki.
- **Hibridlər:** Stable Diffusion = Transformer (mətn) + U-Net (küyü silmək) + VAE (şəkli açmaq). Digər nümunələr: CLIP (2021), Whisper (2022, Azərbaycan dilini də dəstəkləyir).

## 💬 Müasir dil modelləri
- **ChatGPT** 30 noyabr 2022-də çıxdı və 5 gündə 1 milyon istifadəçi topladı. Dil modeli **növbəti tokeni** proqnozlaşdırır.
- **Embedding:** kral − kişi + qadın ≈ kraliça (word2vec, Mikolov, 2013).
- **Köməkçinin 4 təlim mərhələsi:** ① əvvəlcədən təlim (növbəti token) → ② nümunələrlə tənzimləmə → ③ **RLHF** (InstructGPT, 2022) → ④ yoxlanılan mükafat (o1 2024, DeepSeek-R1 2025).
- **Ekspertlər qarışığı (MoE):** marşrutlaşdırıcı hər token üçün bir neçə ekspert seçir. Məsələn, DeepSeek-V3-ün 671 milyard parametrindən hər token üçün 37 milyardı işləyir.
- **2024-də iki Nobel verildi:** fizika üzrə Hopfild və Hinton, kimya üzrə Hassabis və Camper (AlphaFold), Devid Beyker ilə birlikdə.
- **Açıq problemlər:** enerji sərfi (GPT-3-ün təlimi ≈ 1 287 MVt·saat), qara qutu, verilən aclığı, aldadıcı nümunələr.

## ❓ İmtahan sualları
1. CNN-in iki əsas fikri hansılardır? Pulinqin neçə parametri var?
2. LSTM-in qapılarını sadalayın. GRU LSTM-dən nə ilə fərqlənir?
3. Transformer niyə RNN-dən sürətli öyrənir? Onun zəif cəhəti nədir?
4. BERT ilə GPT arasındakı fərqi izah edin.
5. GAN necə işləyir? Diffuziya modeli necə işləyir?
6. Hər tapşırıq üçün uyğun modeli seçin: rentgen, nitq, tərcümə, molekul, saxta üz.

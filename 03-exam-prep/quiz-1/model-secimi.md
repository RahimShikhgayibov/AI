# 🧩 Hansı model? (D hissəsi: 6 tapşırıq ↔ 8 model)

**Üsul:** tapşırıqdakı **verilənin növünü** və **sualın növünü** tap. Model ondan asılıdır.

| Tapşırıqda nə görürsən? | Model | Niyə |
|---|---|---|
| mənzilin qiyməti, temperatur (**ədəd**) | **xətti reqressiya** | «nə qədər?» sualıdır |
| bəli və ya xeyr, **izah olunan** qərar (kredit) | **logistik reqressiya**, qərar ağacı | təsnifatdır və izah olunur |
| **cədvəl** verilənləri, maksimal dəqiqlik | **qradiyent bustinq** | cədvəllər üçün ən güclü üsuldur |
| **etiketsiz** müştəri qrupları | **k-means** | klasterləşmədir (nəzarətsiz öyrənmə) |
| min əlaməti **2D-də göstərmək** | **PCA** | ölçünü azaldır |
| robot, oyun, **sınaq-səhv** | **gücləndirilmiş öyrənmə** | mükafat və cəza ilə öyrənir |
| **şəkil**, rentgen, video kadr | **CNN** | yaxın piksellər əlaqəlidir |
| **zaman sırası**, sensor, **nitq** | **RNN, LSTM** | sıra və yaddaş vacibdir |
| **tərcümə**, çat, uzun mətn, xülasə | **Transformer** | hər söz hər sözə baxır |
| **yeni** şəkil, **saxta** üz | **GAN, diffuziya** | yeni nümunə yaradır |
| **molekul**, yol şəbəkəsi, sosial əlaqələr | **GNN** | verilən qraf şəklindədir |
| şəkli **sıxıb bərpa etmək**, **anomaliya** | **avtokoder** | verilən dar boğazdan keçir |
| **spam**, az verilən, mətn | **sadəlövh Bayes** | sözləri sayır və tez öyrənir |
| **səbəblər və təsirlər**, diaqnoz | **Bayes şəbəkəsi** | asılılıqları qrafla göstərir |
| «**bir az isti**» kimi sözlərlə idarə | **qeyri-səlis məntiq** | üzvlük dərəcələri ilə işləyir |
| **say** (zənglər, qollar) | **Puasson reqressiyası** | GLM, proqnozu heç vaxt mənfi olmur |
| **müsbət məbləğ** (sığorta ödənişi) | **Qamma reqressiyası** | GLM |
| K sinif, **növbəti token** | **softmax reqressiya** | ehtimalların cəmi 1-dir |

## ✍️ Özünü yoxla
1. Molekul zəhərlidirmi?
2. Bir saatda gələn zənglərin sayı
3. Kredit verilsin, yoxsa yox? Bank qərarı izah etməlidir
4. Fabrikdə sensor siqnalları
5. Mövcud olmayan insanların üzlərini yaratmaq
6. Kart əməliyyatlarında qeyri-adi davranışı tapmaq (etiket yoxdur)
7. Kondisioneri «otaq bir az isti» kimi qaydalarla idarə etmək
8. 10 000 əlaməti olan gen verilənlərini vizuallaşdırmaq
9. Rentgen şəklində sınığı tapmaq
10. Azərbaycan dilindən ingilis dilinə uzun mətn tərcüməsi

<details><summary>Cavablar</summary>

1 GNN · 2 Puasson reqressiyası · 3 logistik reqressiya (və ya qərar ağacı) · 4 RNN/LSTM · 5 GAN/diffuziya · 6 avtokoder (anomaliya) · 7 qeyri-səlis məntiq · 8 PCA · 9 CNN · 10 Transformer

</details>

# 🗺️ Yol xəritəsi: .NET Developer → AI Engineer (~18 ay)

**Başlanğıc:** 2026-11-16 · **Hədəf:** 2028-in yazı, junior/middle **AI Engineer**
**Başlanğıc nöqtəsi:** .NET üzrə software engineer · AI-da yeni başlayan · SQL öyrənir
**Vaxt büdcəsi:** həftədə ~7–8 saat (iş günləri ~1 saat + həftəsonu ~2 saat)

---

## 🧭 Əsas fikir

**AI Engineer = güclü backend engineer + AI biliyi.** AI Engineer-in işinin böyük hissəsi API, verilənlər bazası və inteqrasiyadır. Bunun üstünə LLM, RAG, agentlər və qiymətləndirmə (evals) gəlir.

Ona görə sənin **.NET təcrübən üstünlükdür**, ondan imtina etmirik. Bu xəritədə hər blok növbətisinə körpü qurur:

```
SQL (PostgreSQL) ──────────────┐
                               ├──►  RAG: PostgreSQL + pgvector
Python ─► AI anlayışları kodla ┤      Text-to-SQL agent
          ─► klassik ML         ├──►  ASP.NET Core + LLM servisləri
          ─► dərin öyrənmə     ─┘      ↓
                                     🎯 AI Engineer portfolio
```

**İşə götürən sertifikatlara yox, GitHub-dakı layihələrə baxır.** Ona görə hər blok bir layihə ilə bitir.

---

## 📅 Bloklar

### 🗄️ Blok 1: SQL (PostgreSQL) · 8 həftə · 16 noyabr 2026 – 10 yanvar 2027
**Məqsəd:** middle və senior .NET interview səviyyəsində təmiz SQL.
- JOIN-lər, CTE, window functions, dizayn, indekslər, `EXPLAIN ANALYZE`, transaksiyalar, MVCC, EF Core və N+1
- Gün-gün plan: [06-sql/README.md](06-sql/README.md)
- 🛠️ **Layihə:** interview sual bankının öz cavablarınla doldurulması + məşq bazası üzərində 50+ həll olunmuş sorğu
- 🔗 **Körpü:** bu bilik Blok 6-da RAG (pgvector) və text-to-SQL agentində birbaşa işə yarayacaq

> ❄️ **Yanvar:** universitetdə qış imtahan sessiyası. Bu vaxt plan dayanır və imtahanlara hazırlaşırıq.

### 🐍 Blok 2: Python (sürətləndirilmiş) · 4 həftə · fevral 2027
**Məqsəd:** Python-da C# qədər rahat yazmaq. Proqramlaşdırmanı bildiyin üçün sıfırdan yox, **C#-la müqayisə** edərək öyrənirik.
- Sintaksis, siyahı, lüğət, comprehension, funksiyalar, siniflər, virtualenv, pip
- CS50P videolarını 1,5x sürətlə izlə və problem set-lərə fokuslan
- `numpy` və `pandas` əsasları
- 🛠️ **Layihə:** quizdəki bütün hesablamalar Python-da (`05-code/algorithms/`)

### 🧠 Blok 3: AI anlayışlarını kodla qurmaq · 6 həftə · mart – aprel 2027
**Məqsəd:** universitetdə **əzbərlədiyin** mövzuları **anlamaq**. Gün-gün plan: [STUDY-PLAN.md](STUDY-PLAN.md)
- Neyron və ReLU → qradiyent enişi (böyük η-nın sıçradığını öz gözünlə görəcəksən) → 100 000 nəfərlik Bayes simulyasiyası → XOR-u öyrənə bilməyən perseptron → sıfırdan xətti və logistik reqressiya
- 📐 Paralel: 3Blue1Brown, *Linear Algebra* və *Calculus*
- 🛠️ **Layihə:** «AI from scratch» notebook-ları

### 📊 Blok 4: Klassik maşın öyrənməsi · ~3 ay · may – iyul 2027
- **Andrew Ng, Machine Learning Specialization** (Coursera)
- `scikit-learn`: train/test bölgüsü, çarpaz yoxlama, qərar ağacları, random forest, gradient boosting, k-means, PCA
- Kaggle müsabiqələri: Titanic, House Prices
- 🛠️ **Layihə:** Azərbaycanca mətn təsnifatçısı (spam və ya xəbər), sonra onu **ASP.NET Core API** kimi servisə çıxarmaq

### 🔥 Blok 5: Dərin öyrənmə · ~3 ay · avqust – oktyabr 2027
- **Andrej Karpathy, «Neural Networks: Zero to Hero»**: geri yayılmanı öz əlinlə qurursan (micrograd), sonra kiçik GPT
- **PyTorch**: tensorlar, təlim dövrü, CNN, Transformer-in əsasları
- **fast.ai** (əlavə)
- 🛠️ **Layihə:** şəkil təsnifatçısı + Hugging Face Spaces-də demo

### ⭐ Blok 6: LLM və AI Engineering · ~4 ay · noyabr 2027 – fevral 2028
**Bu, hədəf peşənin özüdür. Burada SQL və .NET biliklərin birləşir.**
- LLM API-ləri (Claude, OpenAI): prompt engineering, strukturlaşdırılmış çıxış, tool use (function calling)
- **Embedding-lər və RAG**: **PostgreSQL + pgvector** (Blok 1-in davamı)
- **Agentlər**: alət çağırmaq, çoxaddımlı tapşırıqlar, MCP
- **Evals**: sistemin düz işlədiyini necə ölçürük?
- **.NET tərəfi:** Semantic Kernel, ASP.NET Core ilə AI servisləri · **Python tərəfi:** FastAPI
- Hugging Face, açıq modellər, sadə fine-tuning (LoRA)
- Docker, deploy, monitorinq
- 🛠️ **Layihə 1:** AzTU mühazirələri üzərində **RAG köməkçisi** (bu repodakı konspektlərlə!): ASP.NET Core + pgvector + LLM
- 🛠️ **Layihə 2:** **Text-to-SQL agenti**: «IT şöbəsində orta maaş nədir?» sualını SQL-ə çevirib cavab verir (Blok 1-in tam tətbiqi)

### 💼 Blok 7: Portfolio və iş axtarışı · mart – may 2028
- 3 güclü layihə: README, demo, arxitektura sxemi, eval nəticələri
- Bulud: Azure (.NET üçün təbii seçimdir)
- Interview hazırlığı: SQL (Blok 1-dən hazır), sistem dizaynı, ML əsasları, LLM sistemlərinin dizaynı, DSA
- CV, LinkedIn, müraciətlər: Azərbaycan və remote

---

## 🔄 Həmişə paralel gedənlər
| Nə | Prioritet |
|---|---|
| 🎓 **Universitet AI dərsi** | İmtahandan əvvəlki həftə **1-ci prioritetdir**: material atırsan, birlikdə hazırlaşırıq |
| 💼 **İş (.NET)** | İşdə öyrəndiklərin də bu yolun bir hissəsidir |
| 📔 **Journal** | Hər gün 3 cümlə yaz və commit et 🟩 |

---

## ⚙️ Gündəlik sistem

```
⏱ 25 dəq  ÖYRƏN  — yalnız BİR mənbə: video, kurs və ya izah
⏱ 25 dəq  ET     — kod və ya sorğu yaz (izləmək öyrənmək deyil!)
⏱  5 dəq  QEYD   — journal/YYYY-MM-DD.md: 3 cümlə → commit → 🟩
```
- **Şənbə (~2 saat):** həftənin layihəsi və ya tapşırıq dəsti
- **Bazar (~30 dəq):** Claude ilə həftəlik yoxlama: keçən həftədən və `mistakes.md`-dən test

### Qızıl qaydalar
1. **Mənbə toplama, bitir.** Bir kursu sona qədər bitirmək beş kursa başlamaqdan yaxşıdır.
2. **İzləmək öyrənmək deyil.** Hər videodan sonra eyni şeyi kitaba baxmadan özün yaz.
3. **Zənciri qırma.** Pis gündə də 10 dəqiqə ver.
4. **Təkrar et:** öyrəndiyini 1 gün, 1 həftə və 1 ay sonra yenidən yoxla.
5. **20 dəqiqədən çox ilişib qalma.** Sual ver.

---

## 🤝 Claude ilə necə işləyirik
| Sən deyirsən | Mən edirəm |
|---|---|
| «Bu gün X-i öyrənirəm» | sadə dillə izah edirəm, tapşırıq verirəm, cavablarını yoxlayıram |
| «Material atıram» | konspekt, riyazi hissə və suallar hazırlayıb repoya commit edirəm |
| «İmtahan yaxınlaşır» | sınaq imtahanı hazırlayıram, səhvlərini analiz edirəm |
| «Həftəlik yoxlama» | keçən həftədən test verirəm |
| «Başa düşmədim» | başqa bucaqdan, misalla yenidən izah edirəm |

---

## 📊 İrəliləyiş
| Blok | Status | Başlama | Bitmə |
|---|---|---|---|
| 0. Universitet: Quiz 1 | ✅ | 2026-11-09 | 2026-11-12 |
| 1. SQL (PostgreSQL) | 🟨 | 2026-11-16 | 2027-01-10 |
| 2. Python (sürətləndirilmiş) | ⬜ | 2027-02 | |
| 3. AI anlayışları kodla | ⬜ | 2027-03 | |
| 4. Klassik ML | ⬜ | 2027-05 | |
| 5. Dərin öyrənmə | ⬜ | 2027-08 | |
| 6. LLM və AI Engineering ⭐ | ⬜ | 2027-11 | |
| 7. Portfolio və iş | ⬜ | 2028-03 | |

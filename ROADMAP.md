# 🗺️ Yol xəritəsi: sıfırdan AI Engineer-ə (12–18 ay)

**Başlanğıc:** 2026-11 · **Hədəf:** 2027-nin sonu – 2028-in ortası arasında junior AI Engineer vəzifəsi
**Vaxt büdcəsi:** həftədə ~7–8 saat (iş günləri 1 saat + həftəsonu 2 saat)

---

## 🧭 Əvvəlcə dürüst bir söz

- **12–18 ay realdır**, amma bir şərtlə: **hər gün az-az, fasiləsiz** işləmək. Həftədə 7 saat 1 il ərzində ~350 saat edir. Bu, ciddi bir portfolio qurmaq üçün kifayətdir. Bir ay heç nə edib, sonra bir həftə gecə-gündüz oxumaq isə işləmir.
- **AI Engineer ≠ AI Researcher.** AI Engineer hazır modellərdən (LLM-lər, açıq modellər) istifadə edərək **real məhsul qurur**: çatbotlar, RAG sistemləri, agentlər, avtomatlaşdırma. Bu yol üçün dərin riyaziyyat şərt deyil. **Python, proqramlaşdırma və layihələr** daha vacibdir. Riyaziyyatı «niyə işləyir» sualını başa düşmək üçün öyrənirik.
- **İşə götürən sənin sertifikatına baxmır, GitHub-dakı layihələrinə baxır.** Ona görə hər mərhələ bir layihə ilə bitir.

---

## 📅 Mərhələlər

### Mərhələ 0 — Universitet kursu (davamlı)
Universitetdəki AI dərsi bu yol xəritəsinə paralel gedir. İmtahanlardan əvvəlki həftə **imtahan prioritetdir**: yol xəritəsini dayandırırıq və [03-exam-prep](03-exam-prep/) üzərində işləyirik.

### Mərhələ 1 — Python və alətlər (ay 1–3)
**Məqsəd:** Python-da rahat kod yazmaq.
- [ ] Python əsasları: dəyişənlər, şərtlər, dövrlər, funksiyalar, siyahılar, lüğətlər, fayllar, siniflər
  - Mənbə: **CS50P** (Harvard, pulsuz) **və ya** «Python for Everybody»
- [ ] Git və GitHub: hər gün commit et. Bu repo artıq məşqdir ✅
- [ ] `numpy` və `pandas` əsasları (Kaggle Learn: *Python* və *Pandas* kursları, pulsuz)
- [ ] Paralel olaraq həftədə 1 video: **3Blue1Brown, Essence of Linear Algebra**
- 🛠️ **Layihə:** quiz-dəki bütün hesablamaları Python-da yazmaq (`05-code/algorithms/quiz1.py`)

### Mərhələ 2 — Klassik maşın öyrənməsi (ay 4–6)
**Məqsəd:** verilən → model → qiymətləndirmə dövrünü əllə qurmaq.
- [ ] **Andrew Ng, Machine Learning Specialization** (Coursera, pulsuz audit)
- [ ] `scikit-learn`: xətti və logistik reqressiya, qərar ağacları, k-means, train/test bölgüsü, metrikalar
- [ ] Riyaziyyat: **StatQuest** (ehtimal, statistika), 3Blue1Brown *Essence of Calculus*
- [ ] Kaggle: Titanic və House Prices müsabiqələri
- 🛠️ **Layihə:** Azərbaycanca spam və ya xəbər təsnifatçısı (sadəlövh Bayes ilə logistik reqressiyanı müqayisə et)

### Mərhələ 3 — Dərin öyrənmə (ay 7–9)
**Məqsəd:** neyron şəbəkənin içini başa düşmək və PyTorch ilə model öyrətmək.
- [ ] **Andrej Karpathy, «Neural Networks: Zero to Hero»** (YouTube). micrograd-ı sıfırdan yaz, geri yayılmanı öz əlinlə qur
- [ ] **fast.ai, Practical Deep Learning for Coders** (pulsuz)
- [ ] PyTorch: tensorlar, `nn.Module`, təlim dövrü, CNN
- 🛠️ **Layihə:** öz şəkil təsnifatçın, məsələn Azərbaycan yeməkləri və ya əl yazısı ilə hərflər. Hugging Face Spaces-də canlı demo hazırla

### Mərhələ 4 — LLM və AI Engineering (ay 10–13) ⭐ əsas mərhələ
**Məqsəd:** AI Engineer işinin özünü öyrənmək.
- [ ] LLM API-ləri (Claude, OpenAI): prompt yazmaq, strukturlaşdırılmış çıxış, tool use
- [ ] Embedding-lər, vektor bazaları, **RAG** (sənədlər üzərində sual-cavab)
- [ ] Agentlər: tool calling, çoxaddımlı tapşırıqlar
- [ ] Qiymətləndirmə (evals): sistemin düz işlədiyini necə ölçmək olar?
- [ ] Hugging Face: açıq modelləri yükləmək, sadə fine-tuning (LoRA)
- [ ] Backend: **FastAPI**, Docker əsasları
- 🛠️ **Layihə 1:** AzTU mühazirələri üzərində RAG köməkçisi (bu repodakı konspektlərlə!)
- 🛠️ **Layihə 2:** real problem həll edən bir agent və ya avtomatlaşdırma

### Mərhələ 5 — Portfolio və iş axtarışı (ay 14–18)
- [ ] 3 güclü layihə: README, demo, qiymətləndirmə nəticələri
- [ ] Bulud əsasları (AWS, GCP və ya Azure, birini seç), deploy, monitorinq
- [ ] Müsahibəyə hazırlıq: Python, DSA (LeetCode easy və medium), ML əsasları, sistem dizaynı
- [ ] LinkedIn, CV, təcrübə (internship) müraciətləri. Azərbaycanda və remote

---

## ⚙️ Gündəlik sistem (az vaxtla maksimum nəticə)

### Gündəlik ritual: 45–60 dəqiqə
```
⏱ 25 dəq  ÖYRƏN  — yalnız BİR mənbə: video, kurs və ya kitab
⏱ 25 dəq  ET     — kod yaz və ya tapşırıq həll et (izləmək öyrənmək deyil!)
⏱  5 dəq  QEYD   — journal/YYYY-MM-DD.md: 3 cümlə yaz → commit → GitHub yaşıl 🟩
```

### Həftəlik: bazar günü 1–2 saat
- Həftənin konspektini **öz sözlərinlə** yaz (Feynman metodu: başqasına izah edə bilmirsənsə, hələ başa düşməmisən)
- `mistakes.md` faylını təkrarla
- Layihə üzərində işlə
- Növbəti həftənin planını qur

### Qızıl qaydalar
1. **Mənbə toplama, bitir.** Bir kursu sona qədər bitirmək beş kursa başlamaqdan yaxşıdır.
2. **İzləmək öyrənmək deyil.** Hər videodan sonra eyni şeyi kitaba baxmadan özün yaz.
3. **Zənciri qırma.** Pis gündə də 10 dəqiqə ver. Ardıcıllıq motivasiyadan güclüdür.
4. **Təkrar:** öyrəndiyini 1 gün, 1 həftə və 1 ay sonra yenidən yoxla.
5. **İlişib qalmısansa, 20 dəqiqədən çox itirmə.** Sual ver: Claude-a, forumlara, müəllimə.

---

## 🤝 Claude ilə necə işləyirik

| Sən deyirsən | Mən edirəm |
|---|---|
| «Bu gün X-i öyrənirəm» | Sadə dillə izah edirəm, 3–5 tapşırıq verirəm, cavablarını yoxlayıram |
| «Material atıram» (PDF, slayd) | Konspekt, riyazi hissə və suallar hazırlayıram, sonra repoya commit edirəm |
| «İmtahan yaxınlaşır» | Sınaq imtahanı hazırlayıram, səhvlərini analiz edirəm |
| «Bunu başa düşmədim» | Başqa bucaqdan, misalla yenidən izah edirəm |
| «Həftəlik yoxlama» | Keçən həftənin mövzularından sürətli test verirəm |

---

## 📊 İrəliləyiş

| Mərhələ | Status | Başlama | Bitmə |
|---|---|---|---|
| 0. Universitet: Quiz 1 | ✅ | 2026-11-09 | 2026-11-12 |
| 1. Python və alətlər ([gün-gün plan](STUDY-PLAN.md)) | 🟨 | 2026-11-16 | 2027-02-07 |
| 2. Klassik ML | ⬜ | | |
| 3. Dərin öyrənmə | ⬜ | | |
| 4. LLM və AI Engineering | ⬜ | | |
| 5. Portfolio və iş | ⬜ | | |

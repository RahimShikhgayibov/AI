# 🗄️ SQL (PostgreSQL): middle və senior interview səviyyəsinə qədər

**Məqsəd:** təmiz SQL-i middle və senior **.NET interview** səviyyəsində bilmək.
**Niyə AI reposundadır?** SQL AI Engineer üçün də vacibdir: verilənləri bazadan çəkmək, RAG sistemlərində **pgvector**, text-to-SQL agentləri.
**Verilənlər bazası:** PostgreSQL · **.NET tərəfi:** Npgsql, Dapper, EF Core

---

## 🚀 Başlamaq üçün
1. PostgreSQL-i quraşdır. Ən sürətli yol Docker-dir:
   ```bash
   docker run --name pg -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres:17
   ```
   Docker yoxdursa, postgresql.org saytından yüklə. Sorğu yazmaq üçün **DBeaver**, **pgAdmin** və ya `psql` işlədə bilərsən.
2. Məşq bazasını yarat: [`setup/company.sql`](setup/company.sql) faylını işə sal. İçində şöbələr və işçilər cədvəlləri var.
3. [`00-seviyye-testi.md`](00-seviyye-testi.md) faylındakı testi həll et.

---

## 📅 8 həftəlik plan

| Həftə | Mövzu | PostgreSQL-ə xas | Interview-da tez-tez soruşulur |
|---|---|---|---|
| **1** | `SELECT`, `WHERE`, `ORDER BY`, `DISTINCT`, `CASE`, `NULL` məntiqi, sorğunun icra sırası (logical query processing order) | `LIMIT`/`OFFSET`, `ILIKE`, tiplər: `text`, `numeric`, `timestamptz`, `boolean` | `NULL = NULL` niyə doğru deyil? Sorğu hansı sırada icra olunur? |
| **2** | **JOIN-lər**: inner, left, right, full, cross, self · `UNION` / `UNION ALL` / `INTERSECT` / `EXCEPT` | `USING`, `NATURAL JOIN` (və niyə təhlükəlidir) | LEFT JOIN-da `WHERE` filtri tələsi, UNION və UNION ALL fərqi |
| **3** | `GROUP BY` / `HAVING`, alt sorğular (subqueries), `EXISTS` və `IN`, `NOT IN` + `NULL` tələsi, **CTE**, **rekursiv CTE** | `FILTER (WHERE …)`, `string_agg`, `array_agg` | 2-ci ən yüksək maaş, dublikatlar, menecer iyerarxiyası (rekursiv CTE) |
| **4** | 🔥 **Window functions**: `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`/`LEAD`, kumulyativ cəm (running total), `PARTITION BY`, frame | `DISTINCT ON` | hər qrupda top-N, ardıcıl günlər, ay-ay artım |
| **5** | **Dizayn:** normallaşdırma (1NF–3NF, BCNF), PK, FK, `UNIQUE`, `CHECK`, `ON DELETE`, view, function, procedure, trigger | materialized view, PL/pgSQL, **JSONB**, `GENERATED` / identity sütunlar | normallaşdırma və denormallaşdırma, surrogate və natural key |
| **6** | ⚡ **İndekslər və performans:** B-tree, composite indeksdə sütun sırası, covering index, **SARGability**, statistika | `EXPLAIN ANALYZE`, `INCLUDE`, **partial** və **expression** indekslər, GIN, GiST, BRIN, Hash. **PG-də clustered index yoxdur** (heap + `CLUSTER`) | Sorğu niyə yavaşdır? Hansı indeksi qurardın? Index scan, seq scan, bitmap scan |
| **7** | 🔒 **Transaksiyalar və eyni vaxtda işləmə (concurrency):** ACID, izolyasiya səviyyələri, dirty, non-repeatable və phantom read, lock-lar, deadlock | **MVCC**, `VACUUM`/autovacuum, `SELECT … FOR UPDATE`, `SKIP LOCKED`, SSI (Serializable) | PG-də default izolyasiya səviyyəsi? Dirty read mümkündürmü? Optimistic və pessimistic concurrency |
| **8** | 🟣 **.NET + PostgreSQL:** ADO.NET parametrləri, **Dapper**, **EF Core** (tracking, `AsNoTracking`, `Include`, **N+1**, split query), `IQueryable` və `IEnumerable`, migrations, SQL injection, connection pooling | Npgsql, `COPY` (bulk insert), EF Core-da `xmin` ilə concurrency | **Senior:** partitioning, replication (read replica), sharding, PgBouncer, caching, SQL və NoSQL |

### Həftəlik ritm (AI planı ilə eyni)
- **B.e.–Cümə (~1 saat):** 25 dəqiqə izah (Claude və ya mənbə) → 25 dəqiqə **sorğu yazmaq** → 5 dəqiqə qeyd və commit 🟩
- **Şənbə (~2 saat):** həftənin tapşırıq dəsti (`weekN/` qovluğunda `.sql` faylları)
- **Bazar:** Claude-a «SQL həftəlik yoxlama: Həftə N» yaz, interview tipli sual-cavab olacaq

### Məşq mənbələri
- **pgexercises.com**: PostgreSQL-ə xas tapşırıqlar
- **LeetCode «SQL 50»** study planı: interview tipli suallar
- PostgreSQL rəsmi sənədləri: xüsusilə *Indexes*, *Concurrency Control*, *Performance Tips* bölmələri

---

## 📁 Struktur
| Fayl / qovluq | Nə var |
|---|---|
| [`setup/company.sql`](setup/company.sql) | Məşq bazası: şöbələr və işçilər |
| [`00-seviyye-testi.md`](00-seviyye-testi.md) | Başlanğıc səviyyə testi |
| [`interview-suallari.md`](interview-suallari.md) | Mövzulara görə interview sual bankı |
| `week1/` … `week8/` | Hər həftənin izahı və tapşırıqları (gəldikcə əlavə olunacaq) |

## 📊 İrəliləyiş
| Həftə | Mövzu | Status |
|---|---|---|
| 0 | Səviyyə testi | 🟨 |
| 1 | SELECT və NULL | ⬜ |
| 2 | JOIN-lər | ⬜ |
| 3 | GROUP BY, subqueries, CTE | ⬜ |
| 4 | Window functions | ⬜ |
| 5 | Dizayn | ⬜ |
| 6 | İndekslər və performans | ⬜ |
| 7 | Transaksiyalar və MVCC | ⬜ |
| 8 | .NET + PostgreSQL, senior mövzular | ⬜ |

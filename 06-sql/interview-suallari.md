# 💼 SQL interview sual bankı (PostgreSQL + .NET)

Middle və senior .NET interview-larında ən çox soruşulan suallar. Hər mövzunu keçdikcə suala **öz cavabını** yazırıq.
Səviyyə: 🟢 junior · 🟡 middle · 🔴 senior

## 1. Əsaslar və NULL
- 🟢 `WHERE` və `HAVING` arasındakı fərq nədir?
- 🟢 `DELETE`, `TRUNCATE` və `DROP` arasındakı fərq nədir?
- 🟢 `NULL = NULL` niyə `TRUE` deyil? `IS NULL` və `COALESCE` nə edir?
- 🟡 SQL sorğusunun **məntiqi icra sırası** necədir? (`FROM` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `ORDER BY` → `LIMIT`)
- 🟡 `SELECT` hissəsində verilən alias-ı niyə `WHERE`-də işlətmək olmur?

## 2. JOIN-lər
- 🟢 INNER, LEFT, RIGHT və FULL JOIN arasındakı fərq nədir?
- 🟡 LEFT JOIN-dan sonra `WHERE right_table.col = ...` yazanda nə baş verir? (LEFT JOIN gizlicə INNER JOIN-a çevrilir)
- 🟡 Self join nədir? Nümunə: işçi və onun meneceri.
- 🟢 `UNION` və `UNION ALL` arasındakı fərq nədir? Hansı daha sürətlidir?

## 3. Qruplaşdırma, alt sorğular, CTE
- 🟢 2-ci (N-ci) ən yüksək maaşı tap.
- 🟡 Dublikat sətirləri tap və sil.
- 🟡 `EXISTS` və `IN` arasındakı fərq nədir? `NOT IN` alt sorğuda `NULL` olanda niyə boş nəticə qaytarır?
- 🟡 CTE ilə subquery arasındakı fərq nədir? CTE həmişə materialize olunurmu? (PG 12+ versiyalarda olunmur)
- 🔴 Rekursiv CTE ilə menecer iyerarxiyasını (org chart) qur.

## 4. Window functions
- 🟡 `ROW_NUMBER`, `RANK` və `DENSE_RANK` arasındakı fərq nədir?
- 🟡 Hər şöbədə top-3 maaşı tap.
- 🟡 Kumulyativ cəm (running total) və 3 günlük hərəkətli orta (moving average).
- 🔴 `LAG` ilə ay-ay artımı hesabla. Ardıcıl günləri tap (gaps and islands).
- 🟡 `GROUP BY` ilə window function arasındakı fərq nədir?

## 5. Dizayn
- 🟢 Primary key və unique key arasındakı fərq nədir?
- 🟡 1NF, 2NF və 3NF nədir? Denormallaşdırma nə vaxt məqsədəuyğundur?
- 🟡 Surrogate key və natural key. UUID və bigint identity: üstünlükləri və çatışmazlıqları.
- 🟡 View və materialized view arasındakı fərq nədir?
- 🔴 JSONB nə vaxt məqsədəuyğundur, nə vaxt yox?
- 🟡 Stored procedure və function arasındakı fərq nədir? Trigger-lərin riskləri nələrdir?

## 6. İndekslər və performans
- 🟡 İndeks necə işləyir (B-tree)? Niyə hər sütuna indeks qoymuruq?
- 🟡 Composite indeksdə sütunların sırası niyə vacibdir? (leftmost prefix qaydası)
- 🔴 **SARGability** nədir? `WHERE LOWER(name) = ...` və `WHERE created_at::date = ...` niyə indeksi «öldürür»?
- 🔴 Covering index (`INCLUDE`), partial index və expression index nədir?
- 🔴 `EXPLAIN ANALYZE` çıxışını oxu: Seq Scan, Index Scan, Index Only Scan, Bitmap Heap Scan.
- 🔴 PostgreSQL-də clustered index varmı? (SQL Server ilə müqayisə et)
- 🟡 Yavaş sorğunu necə analiz edərsən? Addımları sadala.

## 7. Transaksiyalar və eyni vaxtda işləmə (concurrency)
- 🟢 ACID nədir?
- 🟡 İzolyasiya səviyyələri nələrdir? Dirty read, non-repeatable read və phantom read nədir?
- 🔴 PostgreSQL-də default izolyasiya səviyyəsi hansıdır? `READ UNCOMMITTED` PG-də necə davranır?
- 🔴 MVCC nədir? `VACUUM` niyə lazımdır? Bloat nədir?
- 🔴 Deadlock nədir, necə yaranır və necə qarşısı alınır?
- 🔴 Optimistic və pessimistic concurrency. `SELECT … FOR UPDATE`. EF Core-da `xmin` / concurrency token.

## 8. .NET + PostgreSQL
- 🟢 SQL injection nədir? Parametrlər onu necə həll edir?
- 🟡 EF Core-da **N+1** problemi nədir? `Include`, projection (`Select`) və split query ilə necə həll olunur?
- 🟡 `IQueryable` və `IEnumerable` arasındakı fərq nədir? Filtr bazada, yoxsa yaddaşda icra olunur?
- 🟡 `AsNoTracking` nə vaxt işlədilir?
- 🟡 Dapper və EF Core: hansını nə vaxt seçərsən?
- 🔴 Connection pooling necə işləyir? Pool niyə tükənir? PgBouncer nə edir?
- 🔴 Böyük həcmdə insert (bulk insert): `COPY` və ya `SaveChanges` dövrdə?

## 9. Senior: miqyaslama (scaling)
- 🔴 Partitioning nədir və sharding-dən fərqi nədir?
- 🔴 Replication: read replica, replication lag, «read your own writes» problemi.
- 🔴 Oxu yükünü necə azaldarsan? (cache, read replica, materialized view)
- 🔴 SQL və NoSQL: hansını nə vaxt seçərsən?

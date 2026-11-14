# 🎯 SQL səviyyə testi (PostgreSQL)

**Məqsəd:** bildiyin mövzuları müəyyən edib 8 həftəlik planı sənə uyğunlaşdırmaq.
**Qaydalar:** Google-a və AI-a baxma, sorğuları əl ilə yaz. Bilmədiyin suala «bilmirəm» yaz. 8–10-cu suallar senior səviyyəsindədir, onları bilməmək normaldır.

Cədvəllər: [`setup/company.sql`](setup/company.sql)
```sql
departments (id, name)
employees   (id, name, salary, department_id, manager_id, hired_at)
```

## 🟢 Əsaslar
1. Maaşı 3000-dən çox olan işçiləri maaşa görə azalan sıra ilə göstər.
2. `SELECT * FROM employees WHERE manager_id = NULL;` nə qaytarır və niyə? Necə düzəltmək olar?

## 🟡 JOIN və qruplaşdırma
3. Hər şöbənin adını və işçi sayını göstər. **İşçisi olmayan şöbələr də 0 ilə görünsün.**
4. `WHERE` ilə `HAVING` arasındakı fərq nədir? Orta maaşı 4000-dən çox olan şöbələri tap.
5. **İkinci ən yüksək maaşı** tap.

## 🟠 Qabaqcıl
6. Hər şöbədə ən çox maaş alan işçini window function ilə göstər.
7. Belə bir indeks var: `CREATE INDEX idx_dept_salary ON employees (department_id, salary);`
   - a) `WHERE salary > 1000` və `WHERE department_id = 3 AND salary > 1000` sorğularından hansı bu indeksdən effektiv istifadə edir? Niyə?
   - b) `name` sütununda da indeks var. `WHERE LOWER(name) = 'rahim'` sorğusu bu indeksdən istifadə edəcəkmi? Niyə?

## 🔴 Middle → Senior
8. Dirty read nədir? PostgreSQL-də default izolyasiya səviyyəsi hansıdır? Dirty read baş verə bilərmi?
9. EF Core-da N+1 problemi nədir və necə həll olunur?
10. PostgreSQL-də MVCC nədir və `VACUUM` nə üçün lazımdır?

---

## 📝 Nəticə
_(Claude yoxladıqdan sonra doldurulacaq)_

| # | Mövzu | Nəticə | Qeyd |
|---|---|---|---|
| 1–10 | | | |

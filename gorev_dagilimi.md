Projedeki belirttiğiniz 2, 3, 4 ve 5 numaralı başlıkları inceledim. Proje oldukça kapsamlı ancak net bir görev ve kısıt listesiyle belirlenmiş. İşte özetle yapılması gerekenler ve güncellenmiş adil iş bölümü önerisi:

### 📌 Projenin Özeti ve Yapılması Gerekenler

**1. Temel Kurallar ve Altyapı:**
*   **ORM Kesinlikle Yasak:** Bütün veritabanı işlemleri (Django, Flask gibi backendler kursanız bile) **RAW SQL** (saf SQL metinleri) ile yazılmalıdır. Sadece MySQL kullanılacaktır.
*   **4 Farklı Kullanıcı Rolü:** Database Manager, Menajer, Oyuncu ve Hakem. Her biri için giriş (login), kayıt (register) ve kendilerine özel yetkilerle donatılmış yönetim panelleri yapılacak. Web arayüzü çok süslü olmak zorunda değil, doğru çalışması yeterli. 
*   **Kısıtlamaların DB Seviyesinde Basılması:** Transferler, lig maçlarının saat çakışmaları (120 dk kuralı), oyuncu bazlı kontrat limitleri (1 Loan, 1 Permanent kuralı) gibi iş kısıtlamaları frontend/backend'deki "IF-ELSE" ile değil, **kesinlikle veritabanı seviyesinde (Trigger, CHECK ve Stored Procedure)** halledilmeli. 

**2. Güvenlik:**
*   **Şifre Politikası:** En az 8 karakter, büyük-küçük harf, rakam ve özel karakter doğrulamaları. Şifreler kesinlikle düz metin olarak değil (ör: bcrypt/SHA-256) **hashlenerek** kaydedilecek.
*   **SQL Injection Koruması:** Kullanıcılardan alınan bilgiler için **Parameterized Queries** kullanılacak.

**3. Veritabanı Normalizasyon Raporu (Part 3):**
*   Proje 1'deki şemanızın fonksiyonel bağımlılıkları (Functional Dependencies) çıkarılacak, tabloların **BCNF** veya **3NF** uyumluluğu kontrol edilecek. Bu kısım için `part3.pdf` adında bir rapor hazırlanacak.

---

### ⚖️ 2 Kişilik Yeni Adil ve Dengeli İş Bölümü

Her iki kişinin de hem veritabanı yazması (SQL) hem de bağımsız iş yüklerini (Güvenlik, Rapor vb.) eşitlenerek alması adına, rolleri iş yükü ağırlıklarına göre (Ağır vs Hafif) 2'şerli olarak dağıttım.

#### 🧑‍💻 Kişi 1: Manager & Player İşlemleri + Temel Altyapı ve Panel
*Manager paneli en karmaşık SQL okuma sorgularını (Liderlik tablosu, Lig Sıralaması vs.) içerir.*

**1. Rol Dağılımı (SQL ve Logikler):**
*   **Menajer (Manager) [Ağır Yük]:** Lig puan durumu tablosu (Win=3, Draw=1), takım kadrosu belirleme (11 ilk, toplam 11-23 oyuncu, Loan kuralı), oyuncu bazlı performans özetleri, rekabetçi istatistik liderleri (Top scorrer vb.) SQL sorgularını yazmak.
*   **Oyuncu (Player) [Hafif Yük]:** Oyuncunun kariyer performansı, takım bazlı istatistikleri, maç ve kontrat/transfer geçmişini listelemek amacıyla karmaşık `GROUP BY` ve tablo birleştirme (`JOIN`) okuma sorgularını yazmak.

**2. Bağımsız Görevler (Panel ve Mimari):**
*   **Web Framework Altyapısı ve Layout:** Backend projesinin (routing) başlatılması, HTML web iskeletinin, CSS panellerinin ve sayfalar arası dolaşım (Navigation) mimarisinin kurulması.
*   **Ortak Formlar:** Bütün Login ve Register (4 tip kullanıcı için) formlarının arayüz olarak tasarlanıp uygulamaya bağlanması.

---

#### 👨‍💻 Kişi 2: Database Manager & Referee İşlemleri + Güvenlik ve Rapor
*Database Manager rolü "Data Integrity" yani sistemi mantıksal hatalardan korumak için yazılacak tüm Procedure ve Trigger'ları kapsar.*

**1. Rol Dağılımı (SQL ve Logikler):**
*   **Database Manager [Ağır Yük]:** Maç planlama (120 saat çakışmamasını Trigger ile engelleme), Transfer ve kontrat yönetimi (max. 1 kiralık, 1 kalıcı kontrat kontrolünü yazdırma), Turnuva/Stadyum sistem yönetimi.
*   **Hakem (Referee) [Hafif Yük]:** Hakem paneli üzerinden bir maça ait final skorunu, kart, gol istatistiklerini ve seyirci kapasitesi kontrolünü DB'ye işleme ile hakem geçmişi sorgularını (`INSERT/UPDATE`) yazmak. 

**2. Bağımsız Görevler (Güvenlik ve DB Tasarımı):**
*   **Güvenlik:** Sistemin tamamında Şifre Politikası doğrulaması, Backend şifre Hashleme altyapısı ve her bir SQL sorgusu için Parametrik Sorgu (SQL Injection koruması) entegrelerinin yapılması.
*   **Normalizasyon Raporu:** Fonksiyonel bağımlılıkları (FD) listeleme ve "Schema Refinement (`part3.pdf`)" raporunun hazırlanılıp tabloların SQL DDL halinin yazılması. 

Talebiniz üzerine her detayı dengeli şekilde 2'ye böldüm, artık ikiniz de arayüz + ağır SQL görevleri + genel modüller almış oldunuz.

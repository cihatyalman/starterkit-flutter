# **StarterKit Flutter (AI-Ready)**

Flutter projeleri için hızlı başlangıç sağlayan, düzenli yapı ve yeniden kullanılabilir widget’lar içeren bir başlangıç kiti.

Bu proje, **Feature-Based (Özellik Odaklı)** yapı ile birlikte **MVVM (Model-View-ViewModel)** mimarisi kullanılarak geliştirilmiştir. Bu sayede ölçeklenebilir, sürdürülebilir ve modüler bir yapı sunar.

📦 **Kurulum ve Kullanım**
<br> - Bu repodaki **lib** klasörünü kendi projenizin **lib** klasörü ile değiştirin.
<br> - İhtiyacınıza göre, kullanmayacağınız klasörleri, örnek feature’ları, demo ekranları kaldırabilirsiniz.

🧠 **Yapay Zeka Destekli Geliştirme (AI-Assisted)**
<br> Bu starterkit, AI asistanlarının (Claude, Cursor vb.) projenin mimarisine sadık kalarak kod üretebilmesi için özel olarak yapılandırılmıştır.
<br> - [CLAUDE.md](CLAUDE.md), AI'a projenin mimarisini ve kodlama standartlarını anlatan ana dosyadır.
<br> - [flutter-coder](ai/flutter-coder.md), AI'ın her kod üretiminde projenin mimarisine, klasör yapısına ve kod standartlarına tam uyum sağlamasını garantileyen prompt'tur.
<br> - [plan-generator](ai/plan-generator.md), büyük özellikler eklemeden önce AI'a önce detaylı bir uygulama planı hazırlatabilir, ardından adım adım hatasız kod ürettirebilirsiniz.

⚠️ **Dikkat Edilmesi Gerekenler**
<br> - Gerekli bağımlılıklar (packages) yüklü değilse proje hata verebilir.
<br> - [hive.dart](starterkit/lib/services/storage/hive.dart) dosyasında bulunan **'\_boxName'** değişkenini projenize uygun şekilde güncellemeniz gerekmektedir.

#

### Kullanılan kütüphaneler:

<table>
  <tr valign="top">
    <td>
      <ul>
        <li>API Service</li>
        <ul>
          <li>dio</li>
        </ul>
        <li>Cache</li>
        <ul>
          <li>hive</li>
          <li>hive_flutter</li>
        </ul>
        <li>Riverpod</li>
        <ul>
          <li>flutter_riverpod</li>
          <li>riverpod_annotation</li>
          <li>riverpod_generator</li>
        </ul>
      </ul>
    </td>
    <td>
      <ul>
        <li>Widgets</li>
        <ul>
          <li>animator</li>
          <li>another_flushbar</li>
          <li>cached_network_image</li>
        </ul>
        <li>Other</li>
        <ul>
          <li>intl</li>
          <li>mask_text_input_formatter</li>
          <li>auto_size_text</li>
          <li>flutter_svg</li>
          <li>animated_bottom_navigation_bar</li>
        </ul>
      </ul>
    </td>
  </tr>
</table>

<br>

# Mimari

### Klasör Yapısı

Proje, kodun okunabilirliğini ve tekrar kullanılabilirliğini artırmak adına belirli sorumluluk alanlarına bölünmüştür:

- [services](starterkit/lib/services): Projeden tamamen bağımsız, genel amaçlı servisleri içerir. Bu katman, farklı projelere doğrudan taşınabilecek (plug-and-play) şekilde tasarlanmıştır (örn: API istemcileri, Firebase servisleri vb.).
  <br> Bu yapıyı projeye eklemek için ihtiyacınız olan servisleri, [flutter-services](https://github.com/cihatyalman/flutter-services) reposundan seçip doğrudan projenize dahil edebilirsiniz.

- [features](starterkit/lib/features): Uygulamanın kalbi burasıdır. Her bir özellik (Login, Home vb.) kendi MVVM katmanlarıyla burada inşa edilir ve yönetilir. Bu sayede özellik bazlı geliştirme ve hata ayıklama kolaylaşır.

- [screens](starterkit/lib/screens): Features içinde hazırlanan mantık ve arayüz parçalarının birleştirildiği katmandır. Uygulamanın navigasyon yapısındaki tüm ana sayfalar burada konumlanır.

- [widgets/custom](starterkit/lib/widgets/custom): Projeden bağımsız, her projede kullanılabilecek genel widget'lar (Örn: CustomButton, CustomInput).

- [widgets/project](starterkit/lib/widgets/project): Sadece bu projeye özgü tasarım dilini ve mantığını yansıtan widget'lar.

- [utils](starterkit/lib/utils): Proje genelinde kullanılan yardımcı (helper) fonksiyonları, extension'ları ve validator'ları içerir.

- [shared](starterkit/lib/shared): Tüm uygulama genelinde paylaşılan kaynakların merkezidir. Proje sabitleri (constants), ortak veri modelleri burada yer alır.

### Feature-Based Architecture

Projeyi teknik katmanlar yerine sunduğu özelliklere (Giriş, Profil, Sepet vb.) göre parçalara ayırırız.

- **Modülerlik:** Yeni bir özellik eklerken veya var olanı silerken tüm proje içinde gezmeniz gerekmez; her şey kendi klasörü altındadır.

- **Düzen ve Çakışma Önleme:** Farklı ekiplerin aynı dosya üzerinde çalışma ihtimalini minimize ederek kod çakışmalarını (conflict) engeller.

### MVVM Mimari Katmanları

Özellikleri kendi içinde sorumluluklarına göre katmanlara ayırarak UI ve iş mantığını (logic) birbirinden tamamen ayırıyoruz:

- **View:** Sadece arayüzün (UI) oluşturulduğu katmandır. Hiçbir iş mantığı içermez.

- **ViewModel:** UI'ın "beyni"dir. Veriyi View için hazırlar ve arayüzdeki kullanıcı hareketlerini yönetir. API istekleri atar ve veriyi yönetir.

- **Store:** Ham verinin depolandığı katmandır.

- **Model:** Veri şablonlarını ve tip dönüşümlerini (JSON serialization) tanımlar.

<br>

# Flutter Snippet

Geliştirme sürecini hızlandırmak ve mimariye uygun kod bloklarını anında oluşturmak için hazırladığım [kod parçalarına](flutter.code-snippets) buradan ulaşabilirsiniz.

<br>

# Demo İçerikleri

- [counter](starterkit/lib/features/counter): Dahili store yapısının nasıl kullanıldığını göstermek amacıyla standart bir counter tasarımı yapılmıştır. Ek olarak riverpod ile yapılmış aynı sistemin bir [kopyasıda](starterkit/lib/features/riverpod) mevcuttur.
  <br>
  <p><img src="assets/counter.webp" width="100" alt="Counter"></p>
- [profile](starterkit/lib/features/profile): Instagram profil sayfasının sadeleştirilmiş bir klonudur. Sadece arayüz örnekleri içermektedir.
  <br>
  <p>
    <img src="assets/profile-1.webp" width="100" alt="Profile Grid">
    <img src="assets/profile-2.webp" width="100" alt="Profile Masonry">
  </p>
- [product](starterkit/lib/features/product): MVVM mimarisini tanıtmak amacıyla basit bir ürün listeleme, ürün detayları ve ürün ekleme/güncelleme gibi işlemleri içeren örnek bir feature oluşturuldu. Verinin katmanlar arasındaki akışını ve durum yönetiminin (state management) mimariye nasıl entegre edildiğini bu örnekte inceleyebilirsiniz.
  <br>
  <p>
    <img src="assets/product-1.webp" width="100" alt="Product List">
    <img src="assets/product-2.webp" width="100" alt="Product Details">
    <img src="assets/product-3.webp" width="100" alt="Product Update">
  </p>
- [widget](starterkit/lib/features/widget): Proje içerisinde yer alan custom ve project seviyesindeki widget'ların kullanım örneklerini içerir. Kendi bileşenlerinizi oluştururken referans alabileceğiniz bir rehber niteliğindedir.
  <br>
  <p>
    <img src="assets/button.webp" width="100" alt="Button">
    <img src="assets/input-1.webp" width="100" alt="Input 1">
    <img src="assets/input-2.webp" width="100" alt="Input 2">
    <img src="assets/image.webp" width="100" alt="Image">
    <img src="assets/list.webp" width="100" alt="List">
    <img src="assets/other-1.webp" width="100" alt="Other 1">
    <img src="assets/other-2.webp" width="100" alt="Other 2">
  </p>

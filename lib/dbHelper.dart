import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'models/product.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'toko.db';

    //create, read databases
    var itemDatabase = openDatabase(path, version: 4, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE product (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        img TEXT,
        nama TEXT,
        SKU TEXT,
        category TEXT,
        model TEXT,
        year TEXT,
        price INTEGER,
        detail TEXT
      )
    ''');
    //pre-populate table product
    await db.rawInsert(
      '''INSERT INTO product (img, nama, SKU, category, model, year, price, detail) VALUES
        ('assets/images/STERLING_PRO_DISC_(2020).jpg', 'STERLING PRO DISC (2020)', 'R700SRPRODB20', 'Road', 'Sterling', '2020', 75000000, 'Pilihlah sepeda yang menawarkan geometri aerodinamis yang superior, kenyamanan yang optimal serta keamanan selama melaju dengan kecepatan maksimal. Yang kau inginkan, semuanya ada di Sterling Pro Disc. Sebuah sepeda balap dengan geometri profesional yang telah diuji dan diverifikasi oleh para pebalap sepeda handal, menjadikan Sterling Pro Disc terdepan di kelasnya. Hadir dengan rangka berbahan carbon yang sangat ringan, dilengkapi dengan groupset top-level, serta sistem pengereman Hydraulic Disc Brake, sepeda allrounder nomor satu di kelasnya ini menyajikan pengalaman terbaik dalam hidupmu akan menjadi kenyataan.\r\n\r\nProduct color: Black'),
        ('assets/images/REV_PARK_(2020).jpg', 'REV PARK (2020)', 'B20RVPK20', 'BMX', 'Rev', '2020', 2465000, 'Tunjukkan aksimu yang mengagumkan dengan Rev Park. Dengan desain yang mengagumkan dan warna menarik, aksi freestlye-mu akan menjadi pengalaman tak terlupakan.\r\n\r\nProduct color: Black'),
        ('assets/images/E-TRIFOLD_(2020).jpg', 'E-TRIFOLD (2020)', 'E16TRFLD20', 'E-Series', 'E-', '2020', 19900000, 'Paduan inovasi termutakhir dengan keistimewaan sepeda lipat terbaik, menjadikan E-Trifold teman bepergian yang nyaman serta ringkas dibawa kemanapun. Koleksi terbaik dari E-Series ini dilengkapi teknologi motor 350 W dan baterai Lithium 8Ah yang kuat melaju hingga 25km/jam.\r\n\r\nProduct color: Blue'),
        ('assets/images/TRIFOLD_11S_LE_(2020).jpg', 'TRIFOLD 11S LE (2020)', 'F16TRIFDLE1120', 'Folding', 'Trifold', '2020', 17500000, 'Ringkas, Modern dan Elegan. Paduan kenyamanan berkendara dan simplisitas fungsi sepeda lipat yang dibalut dengan desain solid dan warna yang berkelas. Trifold 11S LE (Leather Edition) memberi nilai tambah bagi aktivitas komuter sehari-harimu. Jadikan harimu diatas sepeda selalu menyenangkan.\r\n\r\nProduct color: Blue'),
        ('assets/images/GAVRIIL_(2020).jpg', 'GAVRIIL (2020)', 'T29GAVL20', 'Urban', 'Clovis', '2020', 16150000, 'Berpetualanglah kemanapun kau inginkan. Bersama Gavriil, perjalanan panjang menuju lokasi favoritmu akan terasa nyaman dan mengasyikkan. Lewati jalan raya dengan lancar, serta taklukkan medan off-road tanpa halangan berarti. Gavriil menjadi sepeda gravel pertama produksi dalam negeri yang menggunakan groupset Shimano GRX.\r\n\r\nProduct color: Green, Orange'),
        ('assets/images/CLASS_X_26_(2020).jpg', 'CLASS X 26 (2020)', 'C26CLX2620', 'Urban', 'Class', '2020', 2050000, 'Ceriakan harimu bersama sepeda mini yang siap diandalkan kapanpun dan kemanapun kau inginkan. Ingin bertamasya keliling kota atau sekedar berbelanja kebutuhan, Class X siap menemanimu beraktivitas. Dengan warna yang cerah, Class X menambahkan setitik kebahagiaan di harimu dan hidup akan jadi lebih berwarna.\r\n\r\nproduct color:Pink'),
        ('assets/images/EPSILON_T6_(2020).jpg', 'EPSILON T6 (2020)', 'M29EPST620', 'Mountain', 'Epsilon', '2020', 45000000, 'Bebaskan ekspresimu untuk menaklukkan track sesulit apapun bersama Epsilon T6. Tanjakan terjal, turunan curam, atau jalur berbatu sekalipun, tak jadi masalah. Ketangguhan Epsilon T6 diluar ekspektasi. Dilengkapi dengan Shimano Deore XT M8100 yang sangat terpercaya untuk kelas MTB, menghadirkan sistem shifting handal, pengereman yang unggul, serta perawatan yang mudah.\r\n\r\nProduct color: Blue'),
        ('assets/images/EPSILON_C_100_(2020).jpg', 'EPSILON C.100 (2020)', 'M29EPC120', 'Cross Country', 'Epsilon', '2020', 39000000, 'Apapun ambisimu, pastikan untuk mencapainya dengan sebuah sepeda full-suspension yang diciptakan untuk memberi kesan pengalaman off-road terbaikmu. Dengan Epsilon C100, peluangmu hanya satu, melibas jalur sesulit apapun yang ada di depan mata dengan mudah. Frame yang terbuat dari bahan carbon terbaik memberi kesempatan untuk melesat dengan lincah melawan jalur teknikal sekalipun.\r\n\r\nProduct color: Black'),
        ('assets/images/STERLING_R2_DISC_(2020).jpg', 'STERLING R2 DISC (2020)', 'R700SRR2DB20', 'Road', 'Sterling', '2020', 33000000, 'Mengayuhlah kemanapun yang kau kehendaki bersama Sterling R2 Disc. Allrounder impian yang mengedepankan kendali terbaik serta kecepatan yang stabil, kini hadir dengan sistem pengereman Hydraulic Disc Brake. Diciptakan dengan geometri profesional yang revolusioner, menjadikan Sterling R2 Disc pilihan yang tepat bagi para pesepeda yang mengandalkan kekuatan dan ketahanan selama berkendara.\r\n\r\nProduct color: Blue'),
        ('assets/images/STERLIN_R1_DISC_(2020).jpg', 'STERLING R1 DISC (2020)', 'R700SRR1DB20', 'Road', 'Sterling', '2020', 24000000, 'Melaju cepat bersama Sterling R1 Disc di segala medan beraspal. Dibekali frame berbahan HMC-7 carbon material dan dikomandoi groupset Shimano 105 2x11 speed, menjadikan Sterling R1 Disc sepeda all-round yang siap menaklukkan tantangan tanpa masalah berarti. Sistem pengereman Hydraulic Disc Brake menjamin keamanan selama berkendara.\r\n\r\nProduct color: Red'),
        ('assets/images/STYGMA_LITE_(2020).jpg', 'STYGMA LITE (2020)', 'R700STYGLT20', 'Road', 'Stygma', '2020', 12950000, 'Performa terbaik menanti anda. Persiapkan dirimu untuk melaju dengan kecepatan penuh bersama Stygma Lite. Dengan kecepatan penuh dan stabilisasi kendali, Stygma Lite menghadirkan pengalaman tak terlupakan saat melaju diatas track rata nan lurus. Catat waktu terbaikmu bersama sepeda impian.\r\n\r\nProduct color: Grey'),
        ('assets/images/RYKER_MICRO.jpg', 'RYKER MICRO', 'B20RYKRMC19', 'BMX', 'Ryker', '2019', 2367000, 'Mulailah mimpimu untuk menjadi atlit BMX profesional bersama Ryker Micro. Dengan spesifikasi terbaik, Ryker Micro hadir menjadi sepeda yang diandalkan. Sekedar untuk menjajal adrenalinmu di track BMX favoritmu, atau berlaga di kompetisi untuk membuktikan ketangguhanmu, bersiaplah terpukau dan menjadi pemenang dengan sepeda Ryker kesayanganmu. \r\n\r\nProduct color: Orange'),
        ('assets/images/RYKER_PRO_XXL.jpg', 'RYKER PRO XXL', 'B20RYKRPXL19', 'BMX', 'Ryker', '2019', 4200000, 'Sepeda BMX dengan geometri profesional dan spesifikasi terbaik yang memiliki kharisma tersendiri di medan balap. Telah berlaga dan turut memenangkan berbagai kejuaraan nasional maupun internasional oleh tim United Bike Kencana (UBK), Ryker Pro terbukti ketangguhannya menjadi salah satu sepeda BMX terbaik di kelasnya.\r\n\r\nProduct color: Black'),
        ('assets/images/JUMPER_ZERO_(2020).jpg', 'JUMPER ZERO (2020)', 'B20JPZRO20', 'BMX', 'Trail', '2020', 1815000, 'Berkreasilah bersama Jumper Zero. Sepeda BMX keluaran terbaru dari United Bike yang akan membuat harimu lebih bersemangat. Tunjukkan aksimu bersama Jumper Zero, serta luapkan ekspresimu sebebas mungkin. Jadilah pemenang.\r\n\r\nProduct color: Blue'),
        ('assets/images/EPSILON_T5_(2020)_blue.jpg', 'EPSILON T5 (2020)', 'M29EPST120', 'Trail', 'Epsilon', '2020', 22000000, 'Dengan Epsilon T5, kau akan siap untuk segalanya. Dari tanjakan terjal dan teknikal hingga turunan curam, tak ada yang akan menghalangimu. Dengan Rockshox Reba pada fork, menjadikan pengalaman berkendaramu melewati bebatuan terasa begitu nyaman dan terkendali. Beraksilah di track off-road sesuka hatimu, karena Epsilon T5 akan memberikan pengalaman tak terlupakan sepanjang hari.\r\n\r\nProduct color: Blue'),
        ('assets/images/EPSILON_T5_(2020).jpg', 'EPSILON T5 (2020)', 'M29EPST120', 'Trail', 'Epsilon', '2020', 22000000, 'Dengan Epsilon T5, kau akan siap untuk segalanya. Dari tanjakan terjal dan teknikal hingga turunan curam, tak ada yang akan menghalangimu. Dengan Rockshox Reba pada fork, menjadikan pengalaman berkendaramu melewati bebatuan terasa begitu nyaman dan terkendali. Beraksilah di track off-road sesuka hatimu, karena Epsilon T5 akan memberikan pengalaman tak terlupakan sepanjang hari.\r\n\r\nProduct color: Grey'),
        ('assets/images/KYROSS_2_10_(2020)_black.jpg', 'KYROSS 2.10 (2020)', 'MKYRS2120', 'Cross Country', 'Kyross', '2020', 18000000, 'Berniat menjadikan hobi cross-country-mu sebuah adiksi yang sulit dilupakan? Berkendaralah bersama Kyross 2.10. Sepeda hardtail berbahan carbon pada frame yang tidak berkompromi dalam menghadirkan pengalaman tak terlupakan. Jika kamu mengandalkan kecepatan, Kyross 2.10 yang dilengkapi dengan Shimano SLX M7100 1x12 speed menghadirkan kendali yang responsif serta efisiensi maksimum saat melewati jalur tak rata.\r\n\r\nProduct color: Black'),
        ('assets/images/EPSILON_T1_(2020).jpg', 'EPSILON T1 (2020)', 'M29EPST120', 'Cross Country', 'Epsilon', '2020', 12900000, 'Dibekali dengan Shimano Deore M6000-SGS Shadow Design 1x10 Speed dan 34T Narrow Wide, serta paduan XCR Suntour Boost TA Travel 100mm di fork dan SR Suntour Raidon 190 x 51mm pada suspension belakang, Epsilon T1 siap menemanimu melintas di jalur XC favoritmu.\r\n\r\nProduct color: Red'),
        ('assets/images/EPSILON_T2_(2020)_black.jpg', 'EPSILON T2 (2020)', 'MEPST220', 'Cross Country', 'Epsilon', '2020', 15000000, 'Ingin menaklukkan tantangan cross-country incaranmu? Taklukkan bersama Epsilon T2. Jalur berbatu, turunan terjal, maupun rintangan kerikil dipastikan terlewati tanpa masalah. Dilengkapi dengan Rockshox Recon Silver Solo Air Remote Boost TA travel 120mm, serta Shimano Deore XT M8000 1x11 speed pada drivetrain, menjadikan Epsilon T2 senjata ampuh melibas track off-road impianmu.\r\n\r\nProduct color: Black'),
        ('assets/images/TRIFOLD_3S_(2020).jpg', 'TRIFOLD 3S (2020)', 'F16TRFLD3S20', 'Folding', 'Trifold', '2020', 7000000, 'Hadirkan efisiensi di setiap harimu bersama Trifold 3S. Sepeda lipat dengan model trendi dan model lipatan ringkas yang siap memberikan pengalaman tak terlupakan di setiap kayuhannya. Dengan internal cable routing, tentunya menambah kesan simple namun trendi, serta modern untuk menemani aktivitasmu sehari-hari.\r\n\r\nProduct color: Black'),
        ('assets/images/MIAMI_3_00_(2020).jpg', 'MIAMI 3.00 (2020)', 'M275MI30H20', 'Mountain', 'Miami', '2020', 5000000, 'Pacu adrenalinmu bersama Miami 3.00. Tampil memukau dengan ukuran ban 27,5 inch menjadikan tipe sepeda favoritmu semakin gagah dengan pilihan warna yang trendi. Tunjukkan aksimu di track favorit bersama komunitasmu, dan jadilah yang terdepan.\r\n\r\nProduct color: Blue'),
        ('assets/images/DETROIT_7_10_27_5_(2020).jpg', 'DETROIT 7.10 27.5 (2020)', 'MCBRDET7120', 'Mountain', 'Detroit', '2020', 9200000, 'Tipe teranyar dari seri Detroit yang siap menghadirkan pengalaman bersepeda terbaikmu sepanjang hari. Hadir dengan frame berbahan dasar carbon serta ban berukuran 27.5 inch dan 29 inch, Detroit 7.10 merupakan sepeda MTB yang ringan namun kokoh di medannya. Jajal kemampuanmu bersama Detroit 7.10 yang dilengkapi dengan hydraulic disc brake pada rem serta groupset Niseko N12 1x12 speed yang menghadirkan kinerja shifting yang lancar dan tanpa masalah.\r\n\r\nProduct color: Red'),
        ('assets/images/TC_3650i_(2020).jpg', 'TC 3650i (2020)', 'C26TC365020', 'Urban', 'TC', '2020', 2800000, 'TC 3650i selalu siap menemanimu beraktivitas setiap hari. Menikmati suasana luar rumah diatas sepeda menjadi momen tersendiri mengisi waktu luangmu. Dengan frame alloy yang ringan serta dilengkapi pelindung rantai dan spatbor depan belakang untuk memberikan tambahan safety dan kenyamanan dalam berkendara. Bagi Anda yang menyukai desain struktur rangka yang simple, TC 3650i merupakan salah satu rekomendasi terbaik kami untuk Anda.\r\n\r\nProduct color: Red'),
        ('assets/images/E-GAVRIIL_(2020).jpg', 'E-GAVRIIL (2020)', 'T700CEGAVL20', 'E-Series', 'E-', '2020', 47900000, 'Siap melakukan perjalanan panjang tanpa lelah? Mulai petualangan jarak jauhmu bersama E-Gavriil dan alami pengalaman tak terlupakan dalam hidupmu. Koleksi teranyar dari E-Series ini memadukan ketangkasan sepeda gravel dengan kecanggihan inovasi yang mengutamakan kenyamanan dan keamanan pengendaranya.\r\n\r\nProduct color: Black'),
        ('assets/images/GENEVA_(2020).jpg', 'GENEVA (2020)', 'E275GNVA20', 'E-Series', 'Geneva', '2020', 16900000, 'Andalkan intuisimu dan beraksilah bersama Geneva. Dengan motor elektrik 350W, memampukanmu untuk menikmati jalur commuter tanpa perlu kuatir menguras tenaga. Rasakan pengalaman berbeda mengayuh pedal bersama Geneva.');
      ''');
  }

  //select tabel product
  Future<List<Map<String, dynamic>>> selectProduct() async {
    Database db = await this.initDb();
    var mapList = await db.query('product', orderBy: 'nama');
    return mapList;
  }

  //insert menuju tabel user
  Future<Product> search(String favorite) async {
    Database db = await this.initDb();
    Product product;
    List<Map> result =
        await db.rawQuery('SELECT * FROM product WHERE product=?', [product]);
    product = Product.fromMap(result?.first);
    return product;
  }

  //konversi dari bentuk string menuju bentuk map object pada table Product
  Future<List<Product>> getProductList() async {
    var productMapList = await selectProduct();
    int count = productMapList.length;
    List<Product> itemList = List<Product>();
    for (int i = 0; i < count; i++) {
      itemList.add(Product.fromMap(productMapList[i]));
    }
    return itemList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}

-- No 1
CREATE TABLE kapal( 
    kapal_id INT PRIMARY KEY, 
    nama_kapal VARCHAR(100), 
    bendera VARCHAR(50), 
    kapasitas_teus INT
    );

CREATE TABLE kontainer(
    kontainer_id INT PRIMARY KEY,
    nomor_kontainer VARCHAR(20),
    tipe VARCHAR(10),
    berat_ton DECIMAL,
    kapal_id INT,
	FOREIGN KEY(kapal_id) REFERENCES
    kapal(kapal_id)
    );
    
CREATE TABLE transaksi(
    transaksi_id INT PRIMARY KEY,
    kontainer_id INT,
    tanggal_keluar DATE,
    tujuan VARCHAR(100),
    biaya DECIMAL,
	FOREIGN KEY(kontainer_id)REFERENCES
	kontainer(kontainer_id)
    )

-- No 2

INSERT INTO kapal(kapal_id, nama_kapal, bendera, kapasitas_teus)
VALUES(01, 'Kendhaga Nusantara 11', 'Indonesia', 100),
(02, 'Meratus Kupang', 'Indonesia', 848),
(03, 'KM Lognus 4', 'Indonesia', 115);

INSERT INTO kontainer(kontainer_id, nomor_kontainer, tipe, berat_ton, kapal_id)
VALUES(001, 'A101', '20FT', 2.2, 01),
(002, 'A102', '40FT', 3.8, 02),
(003, 'A103', '40FT', 3.9, 03),
(004, 'A104', '20FT', 20.1, 03),
(005, 'A105', '40FT', 30.7, 02);

INSERT INTO transaksi(transaksi_id, kontainer_id, tanggal_keluar, tujuan, biaya)
VALUES(0001, 001, '2025-08-20', 'Surabaya', 200000000),
(0002, 002, '2025-08-20', 'Singapore', 300000000),
(0003, 003, '2025-08-21', 'Malaysia', 150000000),
(0004, 004, '2025-08-21', 'China', 500000000),
(0005, 005, '2025-08-22', 'Surabaya', 400000000)

-- No 3

ALTER TABLE kapal ADD tahun_pembuatan INT

-- No 4

UPDATE kapal SET nama_kapal = 'MV PELABUHAN MAKMUR ' WHERE kapal_id = 02;

-- No 5

SELECT * FROM kontainer WHERE berat_ton > 10

-- No 6

SELECT kapal_id, COUNT(*) AS jumlah_kontainer
FROM kontainer
GROUP BY kapal_id;

-- No 7

SELECT kontainer.kontainer_id, kontainer.nomor_kontainer, kontainer.tipe, kapal.nama_kapal, kapal.bendera 
FROM kontainer join kapal ON(kapal.kapal_id = kontainer.kontainer_id)

-- No 8

SELECT transaksi.transaksi_id, transaksi.kontainer_id, transaksi.tanggal_keluar, transaksi.tujuan, transaksi.biaya, 
kontainer.nomor_kontainer, kapal.nama_kapal FROM kapal
JOIN kontainer ON(kapal.kapal_id = kontainer.kapal_id)
JOIN transaksi ON(kontainer.kontainer_id = transaksi.kontainer_id)

-- No 9

SELECT SUM(biaya) AS total_sales FROM transaksi WHERE tujuan = 'Surabaya';

-- 10

SELECT kapal.kapal_id, kapal.nama_kapal
FROM kapal
LEFT JOIN kontainer ON kontainer.kapal_id = kapal.kapal_id WHERE kontainer.kapal_id  IS NULL;



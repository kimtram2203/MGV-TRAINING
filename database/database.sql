/*câu 1: */
SELECT MaDatPhong, MaDV, SoLuong
FROM chi_tiet_su_dung_dich_vu
WHERE SoLuong > 3 AND SoLuong < 10;
/* câu 2: */
UPDATE phong
SET GiaPhong = GiaPhong + 10
WHERE SoKhachToiDa > 10;
/*cau 3 */
DELETE FROM dat_phong
WHERE TrangThaiDat = 'Da Huy';
/*cau4 */
SELECT TenKH FROM khach_hang
WHERE TenKH LIKE 'H%' OR TenKH LIKE 'N%' OR TenKH LIKE 'M%'
AND LENGTH(TenKH) <= 12;
/* câu 5 */
SELECT DISTINCT TenKH FROM khach_hang;
/* câu 6 */
SELECT MaDV, TenDV, DonViTinh, DonGia 
FROM dich_vu_di_kem
WHERE (DonViTinh = 'lon' AND DonGia > 10000) 
OR (DonViTinh = 'Cai' AND DonGia < 5000);
/* câu 7 */


SELECT dp.MaDatPhong, p.MaPhong, p.LoaiPhong, p.SoKhachToiDa, p.GiaPhong, kh.MaKH, kh.TenKH, kh.SoDT, dp.NgayDat, dp.GioBatDau, dp.GioKetThuc, dv.MaDV, ctdv.SoLuong, dv.DonGia
FROM dat_phong dp
INNER JOIN phong p ON dp.MaPhong = p.MaPhong
INNER JOIN khach_hang kh ON dp.MaKH = kh.MaKH
INNER JOIN chi_tiet_su_dung_dich_vu ctdv ON dp.MaDatPhong = ctdv.MaDatPhong
INNER JOIN dich_vu_di_kem dv ON ctdv.MaDV = dv.MaDV
WHERE YEAR(dp.NgayDat) IN ('2016', '2017') AND p.GiaPhong > 50000 AND ((dv.DonViTinh = 'lon' AND dv.DonGia > 10000) OR (dv.DonViTinh = 'cai' AND dv.DonGia < 5000));

/* câu 8 */
SELECT dp.MaDatPhong, dp.MaPhong, p.LoaiPhong, p.GiaPhong, kh.TenKH, dp.NgayDat, 
    SUM(p.GiaPhong * DATEDIFF(dp.GioKetThuc, dp.GioBatDau)) AS TongTienHat, 
    SUM(dv.DonGia * ctdv.SoLuong) AS TongTienSuDungDichVu, 
    SUM(p.GiaPhong * DATEDIFF(dp.GioKetThuc, dp.GioBatDau)) + SUM(dv.DonGia * ctdv.SoLuong) AS TongTienThanhToan
FROM dat_phong dp
INNER JOIN phong p ON dp.MaPhong = p.MaPhong
INNER JOIN khach_hang kh ON dp.MaKH = kh.MaKH
LEFT JOIN chi_tiet_su_dung_dich_vu ctdv ON dp.MaDatPhong = ctdv.MaDatPhong
LEFT JOIN dich_vu_di_kem dv ON ctdv.MaDV = dv.MaDV
GROUP BY dp.MaDatPhong, dp.MaPhong, p.LoaiPhong, p.GiaPhong, kh.TenKH, dp.NgayDat;

/* câu 9 */
SELECT DISTINCT kh.MaKH, kh.TenKH, kh.DiaChi, kh.SoDT
FROM khach_hang kh
INNER JOIN dat_phong dp ON kh.MaKH = dp.MaKH
INNER JOIN phong ON dp.MaPhong = phong.MaPhong
WHERE phong.LoaiPhong = 'Karaoke' AND kh.DiaChi LIKE '%Hoa xuan%'

/* câu 10 */
SELECT p1.MaPhong, p1.LoaiPhong, p1.SoKhachToiDa, p1.GiaPhong, COUNT(*) as SoLanDat 
FROM dat_phong dp
JOIN phong p1 ON dp.MaPhong = p1.MaPhong
JOIN dat_phong dp2 ON p1.MaPhong = dp2.MaPhong
WHERE dp.TrangThaiDat = 'Da dat' AND dp2.TrangThaiDat = 'Da dat' AND dp.MaDatPhong <> dp2.MaDatPhong
GROUP BY p1.MaPhong
HAVING COUNT(*) > 1;






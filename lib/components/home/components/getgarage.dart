// import 'package:mysql1/mysql1.dart';

// import 'garageModel.dart';

// class Database {
//   static Future<MySqlConnection> getConnection() async {
//     final conn = await MySqlConnection.connect(
//       ConnectionSettings(
//         host: 'localhost',
//         port: 3306,
//         user: 'adminroot',
//         password: '1234',
//         db: 'db_crna',
//       ),
//     );
//     return conn;
//   }

//   static Future<List<garage1>> getData() async {
//     final conn = await getConnection();
//     final results = await conn.query(
//         'SELECT garageid,garagename,garagetel,garagelattitude,garagelonggitude,garageprofile,garageimgid,garageonoff,ownerid,memid ,CONCAT(garagehousenum,garagegroup,garageroad,garagealley,districts.name_th,amphures.name_th,provinces.name_th,garagepostcode) AS address FROM garage INNER JOIN districts ON garagedistrict = districts.id INNER JOIN amphures ON garagearea = amphures.id INNER JOIN provinces ON garageprovince = provinces.id WHERE garageonoff = 1');
//     final garage = results.map((row) {
//       return garage1(
//         name: row[0],
//         type: row[1],
//         shortDesc: row[2],
//         desc: row[3],
//         image: row[4],
//         rate: row[5],
//         price: row[6],
//       );
//     }).toList();
//     await conn.close();
//     return garage;
//   }
// }

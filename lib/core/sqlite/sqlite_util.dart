import 'dart:io';

import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

///数据库sqlite
class SqliteUtil {
  ///单例
  SqliteUtil._internal();

  static final SqliteUtil _instance = SqliteUtil._internal();

  factory SqliteUtil() => _instance;
  static late Database database;

  ///获取数据库
  static getInstance() async {
    database = await getDatabase(databaseName);
    return _instance;
  }

  static Future<Database> getDatabase(String databaseName) async {
    var databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    if (await Directory(dirname(path)).exists()) {
      if (Constant.isDebug) {
        print("数据库目录${dirname(path)}");
      }
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        createTable(
          tableName: tableWechatMessageHistory,
          columns: {
            columnSenderId: ColumnIdType.text,
            columnReceiverId: ColumnIdType.text,
            columnMessageContent: ColumnIdType.text,
            columnMessageDate: ColumnIdType.int,
            columnUserAvatar: ColumnIdType.text,
          },
          db: db,
        );
      },
    );
  }

  ///数据库名
  static String databaseName = "bilibili-V5.db";

  ///存储历史消息
  static String tableWechatMessageHistory = "tableWechatMessageHistory";
  static String columnSenderId = "columnSenderId";
  static String columnReceiverId = "columnReceiverId";
  static String columnMessageContent = "columnMessageContent";
  static String columnMessageDate = "columnMessageDate";
  static String columnUserAvatar = "columnUserAvatar";

  ///列表表项
  static Map<ColumnIdType, String> columnTypeMap = {
    ColumnIdType.text: "TEXT",
    ColumnIdType.int: "INT"
  };

  ///创建表sql语句
  static String createTableSql({
    required String tableName,
    required Map<String, ColumnIdType> columns,
  }) {
    String sql = "CREATE TABLE $tableName (id INTEGER PRIMARY KEY";
    columns.forEach((key, value) {
      sql += ", $key ${columnTypeMap[value]}";
    });
    sql += ")";
    return sql;
  }

  ///建表
  static createTable({
    required String tableName,
    required Map<String, ColumnIdType> columns,
    Database? db,
  }) async {
    db != null
        ? await db
            .execute(createTableSql(tableName: tableName, columns: columns))
        : await database
            .execute(createTableSql(tableName: tableName, columns: columns));
  }

  ///根据条件删数据
  static clearTable(String tableName, Map<String, dynamic> map) async {
    String tempSql = "WHERE ";
    int i = 0;
    map.forEach((key, value) {
      tempSql += "${key} = \'${value}\'";
      i++;
      if (i != map.length) {
        tempSql += " && ";
      }
    });
    await database.execute("DELETE FROM $tableName $tempSql");
  }

  ///插入数据
  static insertTable({
    required String tableName,
    required Map<String, dynamic> map,
  }) async {
    String columns = "";
    String values = "";
    map.forEach((key, value) {
      columns += "$key,";
      values += "\'$value\',";
    });
    columns = columns.substring(0, columns.length - 1);
    values = values.substring(0, values.length - 1);
    String sql = 'INSERT INTO $tableName($columns) VALUES($values)';
    await database.execute(sql);
  }

  ///查询数据
  static Future<List<Map>> queryTable({
    required String tableName,
    String? where,
    List? whereArgs,
    required String orderBy,
  }) async {
    return await database.query(tableName, where: where, whereArgs: whereArgs, orderBy: orderBy);
  }
}

enum ColumnIdType {
  text,
  int,
}

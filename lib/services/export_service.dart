import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import '../models/song.dart';

/// Service for exporting song library to various formats
class ExportService {
  /// Export songs to CSV format
  Future<String> exportToCSV(List<Song> songs, String filename) async {
    try {
      // Prepare CSV data
      List<List<dynamic>> rows = [];
      
      // Add headers
      rows.add(['Title', 'Artist', 'Album', 'Duration', 'Source']);
      
      // Add song data
      for (var song in songs) {
        rows.add([
          song.title,
          song.artist,
          song.album,
          song.formattedDuration,
          song.source,
        ]);
      }
      
      // Convert to CSV string
      String csv = const ListToCsvConverter().convert(rows);
      
      // Save file
      final filePath = await _saveFile(csv, filename, 'csv');
      return filePath;
    } catch (e) {
      throw Exception('Failed to export CSV: $e');
    }
  }

  /// Export songs to Excel (XLSX) format
  Future<String> exportToExcel(List<Song> songs, String filename) async {
    try {
      var excel = Excel.createExcel();
      Sheet sheetObject = excel['Song Library'];
      
      // Add headers with styling
      sheetObject.appendRow([
        TextCellValue('Title'),
        TextCellValue('Artist'),
        TextCellValue('Album'),
        TextCellValue('Duration'),
        TextCellValue('Source'),
      ]);
      
      // Add song data
      for (var song in songs) {
        sheetObject.appendRow([
          TextCellValue(song.title),
          TextCellValue(song.artist),
          TextCellValue(song.album),
          TextCellValue(song.formattedDuration),
          TextCellValue(song.source),
        ]);
      }
      
      // Save file
      var fileBytes = excel.save();
      if (fileBytes == null) {
        throw Exception('Failed to generate Excel file');
      }
      
      final filePath = await _saveFileBytes(fileBytes, filename, 'xlsx');
      return filePath;
    } catch (e) {
      throw Exception('Failed to export Excel: $e');
    }
  }

  /// Export songs to JSON format
  Future<String> exportToJSON(List<Song> songs, String filename) async {
    try {
      // Convert songs to JSON
      List<Map<String, dynamic>> jsonData = songs.map((song) => song.toJson()).toList();
      
      // Pretty print JSON
      String jsonString = const JsonEncoder.withIndent('  ').convert(jsonData);
      
      // Save file
      final filePath = await _saveFile(jsonString, filename, 'json');
      return filePath;
    } catch (e) {
      throw Exception('Failed to export JSON: $e');
    }
  }

  /// Save string content to file
  Future<String> _saveFile(String content, String filename, String extension) async {
    try {
      // Request storage permission
      await _requestStoragePermission();
      
      // Get directory
      Directory? directory;
      if (Platform.isAndroid) {
        directory = await getExternalStorageDirectory();
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      }
      
      if (directory == null) {
        throw Exception('Could not access storage directory');
      }
      
      // Create file path
      final filePath = '${directory.path}/$filename.$extension';
      final file = File(filePath);
      
      // Write content to file
      await file.writeAsString(content);
      
      return filePath;
    } catch (e) {
      throw Exception('Failed to save file: $e');
    }
  }

  /// Save bytes content to file
  Future<String> _saveFileBytes(List<int> bytes, String filename, String extension) async {
    try {
      // Request storage permission
      await _requestStoragePermission();
      
      // Get directory
      Directory? directory;
      if (Platform.isAndroid) {
        directory = await getExternalStorageDirectory();
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      }
      
      if (directory == null) {
        throw Exception('Could not access storage directory');
      }
      
      // Create file path
      final filePath = '${directory.path}/$filename.$extension';
      final file = File(filePath);
      
      // Write bytes to file
      await file.writeAsBytes(bytes);
      
      return filePath;
    } catch (e) {
      throw Exception('Failed to save file: $e');
    }
  }

  /// Request storage permission
  Future<void> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }
    }
  }

  /// Share exported file
  Future<void> shareFile(String filePath, String filename) async {
    try {
      final file = XFile(filePath);
      await Share.shareXFiles(
        [file],
        subject: 'Song Library Export - $filename',
        text: 'Here is my exported song library',
      );
    } catch (e) {
      throw Exception('Failed to share file: $e');
    }
  }

  /// Get file size in human-readable format
  String getFileSize(String filePath) {
    try {
      final file = File(filePath);
      final bytes = file.lengthSync();
      
      if (bytes < 1024) {
        return '$bytes B';
      } else if (bytes < 1024 * 1024) {
        return '${(bytes / 1024).toStringAsFixed(2)} KB';
      } else {
        return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
      }
    } catch (e) {
      return 'Unknown';
    }
  }
}

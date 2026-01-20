import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/gradient_button.dart';
import '../models/song.dart';
import '../services/export_service.dart';

/// Export dialog for selecting format and exporting songs
class ExportDialog extends StatefulWidget {
  final List<Song> songs;
  final List<Song> selectedSongs;

  const ExportDialog({
    super.key,
    required this.songs,
    required this.selectedSongs,
  });

  @override
  State<ExportDialog> createState() => _ExportDialogState();
}

class _ExportDialogState extends State<ExportDialog> {
  String _selectedFormat = 'CSV';
  bool _exportAll = true;
  bool _isExporting = false;
  final _filenameController = TextEditingController();
  final _exportService = ExportService();

  @override
  void initState() {
    super.initState();
    _filenameController.text = 'song_library_${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  void dispose() {
    _filenameController.dispose();
    super.dispose();
  }

  Future<void> _handleExport() async {
    setState(() {
      _isExporting = true;
    });

    try {
      final songsToExport = _exportAll ? widget.songs : widget.selectedSongs;
      final filename = _filenameController.text.trim();

      if (filename.isEmpty) {
        throw Exception('Please enter a filename');
      }

      if (songsToExport.isEmpty) {
        throw Exception('No songs to export');
      }

      String filePath;

      switch (_selectedFormat) {
        case 'CSV':
          filePath = await _exportService.exportToCSV(songsToExport, filename);
          break;
        case 'Excel':
          filePath = await _exportService.exportToExcel(songsToExport, filename);
          break;
        case 'JSON':
          filePath = await _exportService.exportToJSON(songsToExport, filename);
          break;
        default:
          throw Exception('Invalid format');
      }

      if (!mounted) return;

      // Show success dialog
      Navigator.pop(context);
      _showSuccessDialog(filePath, filename);
    } catch (e) {
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Export failed: ${e.toString()}'),
          backgroundColor: AppColors.accentRed,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isExporting = false;
        });
      }
    }
  }

  void _showSuccessDialog(String filePath, String filename) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: AppColors.accentGreen, size: 28),
            SizedBox(width: 12),
            Text('Export Successful'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('File saved successfully!'),
            const SizedBox(height: 8),
            Text(
              'Location: $filePath',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Size: ${_exportService.getFileSize(filePath)}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _exportService.shareFile(filePath, filename);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryCyan,
              foregroundColor: AppColors.textWhite,
            ),
            child: const Text('Share'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Export Song Library',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Format selection
            const Text(
              'Export Format',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildFormatChip('CSV'),
                const SizedBox(width: 8),
                _buildFormatChip('Excel'),
                const SizedBox(width: 8),
                _buildFormatChip('JSON'),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Export scope
            const Text(
              'Export Scope',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildScopeOption(
                    'All Songs',
                    '${widget.songs.length} songs',
                    true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildScopeOption(
                    'Selected',
                    '${widget.selectedSongs.length} songs',
                    false,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Filename input
            const Text(
              'Filename',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _filenameController,
              decoration: InputDecoration(
                hintText: 'Enter filename',
                filled: true,
                fillColor: AppColors.inputBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isExporting ? null : () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(color: AppColors.primaryCyan),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.primaryCyan),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GradientButton(
                    text: 'Export',
                    onPressed: _handleExport,
                    isLoading: _isExporting,
                    height: 48,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormatChip(String format) {
    final isSelected = _selectedFormat == format;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedFormat = format;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: isSelected ? AppColors.buttonGradient : null,
            color: isSelected ? null : AppColors.backgroundGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              format,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.textWhite : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScopeOption(String title, String subtitle, bool isAll) {
    final isSelected = _exportAll == isAll;
    return GestureDetector(
      onTap: () {
        setState(() {
          _exportAll = isAll;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.primaryCyan : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primaryCyan : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

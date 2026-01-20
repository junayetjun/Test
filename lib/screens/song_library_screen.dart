import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../models/song.dart';
import '../data/sample_songs.dart';
import '../widgets/export_dialog.dart';

/// Song library screen with search, sort, and export features
class SongLibraryScreen extends StatefulWidget {
  const SongLibraryScreen({super.key});

  @override
  State<SongLibraryScreen> createState() => _SongLibraryScreenState();
}

class _SongLibraryScreenState extends State<SongLibraryScreen> {
  List<Song> _allSongs = [];
  List<Song> _filteredSongs = [];
  List<Song> _selectedSongs = [];
  bool _isSelectionMode = false;
  String _searchQuery = '';
  String _sortBy = 'title'; // title, artist, duration

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  void _loadSongs() {
    _allSongs = SampleSongs.getSampleSongs();
    _filteredSongs = List.from(_allSongs);
    _sortSongs();
  }

  void _sortSongs() {
    setState(() {
      switch (_sortBy) {
        case 'title':
          _filteredSongs.sort((a, b) => a.title.compareTo(b.title));
          break;
        case 'artist':
          _filteredSongs.sort((a, b) => a.artist.compareTo(b.artist));
          break;
        case 'duration':
          _filteredSongs.sort((a, b) => a.duration.compareTo(b.duration));
          break;
      }
    });
  }

  void _filterSongs(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredSongs = List.from(_allSongs);
      } else {
        _filteredSongs = _allSongs.where((song) {
          return song.title.toLowerCase().contains(query.toLowerCase()) ||
              song.artist.toLowerCase().contains(query.toLowerCase()) ||
              song.album.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
      _sortSongs();
    });
  }

  void _toggleSelection(Song song) {
    setState(() {
      if (_selectedSongs.contains(song)) {
        _selectedSongs.remove(song);
      } else {
        _selectedSongs.add(song);
      }
    });
  }

  void _toggleSelectionMode() {
    setState(() {
      _isSelectionMode = !_isSelectionMode;
      if (!_isSelectionMode) {
        _selectedSongs.clear();
      }
    });
  }

  void _selectAll() {
    setState(() {
      if (_selectedSongs.length == _filteredSongs.length) {
        _selectedSongs.clear();
      } else {
        _selectedSongs = List.from(_filteredSongs);
      }
    });
  }

  void _showExportDialog() {
    showDialog(
      context: context,
      builder: (context) => ExportDialog(
        songs: _allSongs,
        selectedSongs: _selectedSongs,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        title: _isSelectionMode
            ? Text('${_selectedSongs.length} selected')
            : const Text('Song Library'),
        leading: _isSelectionMode
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: _toggleSelectionMode,
              )
            : null,
        actions: [
          if (_isSelectionMode)
            IconButton(
              icon: const Icon(Icons.select_all),
              onPressed: _selectAll,
              tooltip: 'Select All',
            ),
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: _showExportDialog,
            tooltip: 'Export',
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              setState(() {
                _sortBy = value;
                _sortSongs();
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'title',
                child: Text('Sort by Title'),
              ),
              const PopupMenuItem(
                value: 'artist',
                child: Text('Sort by Artist'),
              ),
              const PopupMenuItem(
                value: 'duration',
                child: Text('Sort by Duration'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterSongs,
              decoration: InputDecoration(
                hintText: 'Search songs, artists, albums...',
                prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
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
          ),

          // Song count and selection mode toggle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_filteredSongs.length} songs',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                TextButton.icon(
                  onPressed: _toggleSelectionMode,
                  icon: Icon(
                    _isSelectionMode ? Icons.check_circle : Icons.check_circle_outline,
                    size: 18,
                  ),
                  label: Text(_isSelectionMode ? 'Done' : 'Select'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryCyan,
                  ),
                ),
              ],
            ),
          ),

          // Song list
          Expanded(
            child: _filteredSongs.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.music_note,
                          size: 64,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchQuery.isEmpty
                              ? 'No songs in library'
                              : 'No songs found',
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredSongs.length,
                    itemBuilder: (context, index) {
                      final song = _filteredSongs[index];
                      final isSelected = _selectedSongs.contains(song);

                      return ListTile(
                        leading: _isSelectionMode
                            ? Checkbox(
                                value: isSelected,
                                onChanged: (_) => _toggleSelection(song),
                                activeColor: AppColors.primaryCyan,
                              )
                            : Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  gradient: AppColors.buttonGradient,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.music_note,
                                  color: AppColors.textWhite,
                                ),
                              ),
                        title: Text(
                          song.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              song.artist,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${song.album} • ${song.formattedDuration}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: song.source == 'Spotify'
                                    ? Colors.green.shade50
                                    : Colors.pink.shade50,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                song.source,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: song.source == 'Spotify'
                                      ? Colors.green.shade700
                                      : Colors.pink.shade700,
                                ),
                              ),
                            ),
                            if (!_isSelectionMode) ...[
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.chevron_right,
                                color: AppColors.textSecondary,
                              ),
                            ],
                          ],
                        ),
                        onTap: _isSelectionMode
                            ? () => _toggleSelection(song)
                            : () {
                                // Handle song tap (play, view details, etc.)
                              },
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showExportDialog,
        backgroundColor: AppColors.primaryCyan,
        icon: const Icon(Icons.file_download, color: AppColors.textWhite),
        label: const Text(
          'Export',
          style: TextStyle(
            color: AppColors.textWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

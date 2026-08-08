import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

const _reasons = ['Spam', 'Harassment', 'Misinformation', 'Impersonation', 'Other'];

class ReportContentScreen extends StatefulWidget {
  const ReportContentScreen({super.key});

  @override
  State<ReportContentScreen> createState() => _ReportContentScreenState();
}

class _ReportContentScreenState extends State<ReportContentScreen> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
      ),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
                  Expanded(child: Text('Report Post', style: AppText.title, textAlign: TextAlign.center)),
                  const SizedBox(width: 48),
                ],
              ),
              ..._reasons.map((r) => RadioListTile<String>(
                    key: Key('report-reason-${r.toLowerCase()}'),
                    value: r,
                    groupValue: _selected,
                    onChanged: (v) => setState(() => _selected = v),
                    title: Text(r, style: AppText.body),
                    activeColor: AppColors.accentFill,
                    contentPadding: EdgeInsets.zero,
                  )),
              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(labelText: 'Add details (optional)'),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('submit-report-button'),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Submit Report'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

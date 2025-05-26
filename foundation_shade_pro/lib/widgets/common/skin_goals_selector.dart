import 'package:flutter/material.dart';

class SkinGoalsSelector extends StatelessWidget {
  final List<Map<String, dynamic>> skinGoals;
  final List<String> selectedGoals;
  final void Function(String) onToggleGoal;
  const SkinGoalsSelector({
    Key? key,
    required this.skinGoals,
    required this.selectedGoals,
    required this.onToggleGoal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.85,
      children:
          skinGoals.map((goal) {
            final isSelected = selectedGoals.contains(goal['label']);
            return GestureDetector(
              onTap: () => onToggleGoal(goal['label']),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        isSelected ? Colors.deepPurple : Colors.grey.shade300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  color:
                      isSelected
                          ? Colors.deepPurple.withOpacity(0.08)
                          : Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      goal['icon'],
                      size: 32,
                      color: isSelected ? Colors.deepPurple : Colors.black54,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      goal['label'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.deepPurple : Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }
}

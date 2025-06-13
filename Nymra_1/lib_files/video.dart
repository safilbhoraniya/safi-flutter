import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymra/commentclass.dart';

class videopost extends StatefulWidget {
  const videopost({Key? key}) : super(key: key);

  @override
  State<videopost> createState() => _videopostState();
}

class _videopostState extends State<videopost> {
  bool isLiked = false;

  void like() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void _showComments()
  {
    showModalBottomSheet
      (
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context)
      {
        return commentclass();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder
        (
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      shadowColor: Colors.black12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:
        [
          Image.network
            (
            'https://cdn.dribbble.com/userupload/20510884/file/original-4209f6b468ec459bcf1d41102c4eed4f.gif',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Container(
                color: Colors.grey.shade200,
                child: Center(child: CircularProgressIndicator()),
                height: 200,
              );
            },

          ),



          Padding
            (
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row
              (
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                InkWell
                  (
                  onTap: like,
                  borderRadius: BorderRadius.circular(20),
                  child: Row
                    (
                    children:
                    [
                      Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.redAccent : Colors.black87,
                        size: 28,
                      ),
                      SizedBox(width: 6),
                      Text
                        (
                        'Like',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: isLiked ? Colors.redAccent : const Color(0xFF6B7280),
                          fontWeight: isLiked ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(width: 24),
                // Comment Button
                InkWell
                  (
                  onTap: _showComments,
                  borderRadius: BorderRadius.circular(20),
                  child: Row
                    (
                    children:
                    [
                      Icon
                        (
                        Icons.comment_outlined,
                        color: Colors.black87,
                        size: 28,
                        ),
                      SizedBox(width: 6),
                      Text
                        (
                        'Comment',
                        style: theme.textTheme.bodyMedium,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
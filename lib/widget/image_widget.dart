import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_ed/widget/bottomsheet_widget.dart';

class ImagePickerWidget {
  static showImagePickerDialog(BuildContext context,
      {Function? onCameraTap, Function? onGalleryTap}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Add image",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    onCameraTap!();
                  },
                  child: Row(
                    children: const [
                      SizedBox(width: 15),
                      Icon(Icons.camera),
                      SizedBox(width: 15),
                      Text("Take a new photo"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    onGalleryTap!();
                  },
                  child: Row(
                    children: const [
                      SizedBox(width: 15),
                      Icon(Icons.phone_iphone),
                      SizedBox(width: 15),
                      Text("Upload from device"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget imageWidget(List<dynamic> images, Function getImageWidget,
      {int? maxImages}) {
    if (images.isEmpty) {
      return GestureDetector(
        onTap: () => getImageWidget(),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: 1.5),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: SizedBox(
              height: 80,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.cloud_upload,
                    color: Colors.black,
                    size: 30,
                  ),
                  Text(
                    'Tap here to upload your note',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Wrap(
        children: [
          Wrap(
            children: List.generate(
              maxImages != null
                  ? images.length
                  : images.length > 5
                      ? 5
                      : images.length,
              (index) {
                return Stack(
                  children: [
                    Container(
                      height: 80,
                      width: 90,
                      margin: const EdgeInsets.only(right: 10, top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: FileImage(File(images[index])),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.directional(
                      end: 75,
                      start: -14,
                      top: -11,
                      bottom: 120,
                      textDirection: TextDirection.rtl,
                      child: IconButton(
                        onPressed: () => images.removeAt(index),
                        icon:
                            const Icon(Icons.remove_circle, color: Colors.red),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          images.length >= (maxImages ?? 5)
              ? const Center()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => getImageWidget(),
                      child: const Text('Add another'),
                    ),
                  ],
                ),
        ],
      );
    }
  }
}

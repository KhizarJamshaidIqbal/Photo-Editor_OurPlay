// ignore_for_file: file_names, non_constant_identifier_names, unused_element, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_editer_tool/share/edit_image_viewmodel.dart';
import 'package:screenshot/screenshot.dart';

import '../share/image_text.dart';

class EditeImage extends StatefulWidget {
  final String SelectedImage;
  const EditeImage({super.key, required this.SelectedImage});

  @override
  State<EditeImage> createState() => _EditeImageState();
}

class _EditeImageState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Screenshot(
                controller: screenshotController,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Stack(
                    children: [
                      _selectedImage,
                      for (int i = 0; i < texts.length; i++)
                        Positioned(
                          left: texts[i].left,
                          top: texts[i].top,
                          child: GestureDetector(
                            onLongPress: () {
                              setState(() {
                                currentIndex = i;
                                removeText(context);
                              });
                            },
                            onTap: () => setCurrentIndex(context, i),
                            child: Draggable(
                              feedback: ImageText(textInfo: texts[i]),
                              child: ImageText(textInfo: texts[i]),
                              onDragEnd: (drag) {
                                final renderBox =
                                    context.findRenderObject() as RenderBox;
                                Offset off =
                                    renderBox.globalToLocal(drag.offset);
                                setState(() {
                                  texts[i].top = off.dy - 180;
                                  texts[i].left = off.dx;
                                });
                              },
                            ),
                          ),
                        ),
                      creatorText.text.isNotEmpty
                          ? Positioned(
                              left: 0,
                              bottom: 0,
                              child: Text(
                                creatorText.text,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(
                                      0.3,
                                    )),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _addnewtexfab,
    );
  }

  Widget get _selectedImage => Center(
        child: Image.file(
          File(
            widget.SelectedImage,
          ),
          width: MediaQuery.of(context).size.width,
        ),
      );
  Widget get _addnewtexfab => FloatingActionButton(
        onPressed: () => AddNewDilogBox(context),
        tooltip: "Add New Text",
        // ignore: sort_child_properties_last
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      );
  AppBar get _appBar => AppBar(
      backgroundColor: Colors.white24,
      automaticallyImplyLeading: false,
      title: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: 'Go to Back',
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.save,
                color: Colors.black,
              ),
              onPressed: () => saveToGallery(context),
              tooltip: 'Save Image',
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: increaseFontSize,
              tooltip: 'Increase font size',
            ),
            IconButton(
              icon: const Icon(
                Icons.remove,
                color: Colors.black,
              ),
              onPressed: decreaseFontSize,
              tooltip: 'Decrease font size',
            ),
            IconButton(
              icon: const Icon(
                Icons.format_align_left,
                color: Colors.black,
              ),
              onPressed: alignLeft,
              tooltip: 'Align left',
            ),
            IconButton(
              icon: const Icon(
                Icons.format_align_center,
                color: Colors.black,
              ),
              onPressed: alignCenter,
              tooltip: 'Align Center',
            ),
            IconButton(
              icon: const Icon(
                Icons.format_align_right,
                color: Colors.black,
              ),
              onPressed: alignRight,
              tooltip: 'Align Right',
            ),
            IconButton(
              icon: const Icon(
                Icons.format_bold,
                color: Colors.black,
              ),
              onPressed: boldText,
              tooltip: 'Bold',
            ),
            IconButton(
              icon: const Icon(
                Icons.format_italic,
                color: Colors.black,
              ),
              onPressed: italicText,
              tooltip: 'Italic',
            ),
            IconButton(
              icon: const Icon(
                Icons.space_bar,
                color: Colors.black,
              ),
              onPressed: addLinesToText,
              tooltip: 'Add New Line',
            ),
            Tooltip(
              message: 'Red',
              child: GestureDetector(
                  onTap: () => changeTextColor(Colors.red),
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
              message: 'White',
              child: GestureDetector(
                  onTap: () => changeTextColor(Colors.white),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
              message: 'Black',
              child: GestureDetector(
                  onTap: () => changeTextColor(Colors.black),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
              message: 'Blue',
              child: GestureDetector(
                  onTap: () => changeTextColor(Colors.blue),
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
              message: 'Yellow',
              child: GestureDetector(
                  onTap: () => changeTextColor(Colors.yellow),
                  child: const CircleAvatar(
                    backgroundColor: Colors.yellow,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
              message: 'Green',
              child: GestureDetector(
                  onTap: () => changeTextColor(Colors.orange),
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
              message: 'Orange',
              child: GestureDetector(
                  onTap: () => changeTextColor(Colors.orange),
                  child: const CircleAvatar(
                    backgroundColor: Colors.orange,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
              message: 'Pink',
              child: GestureDetector(
                  onTap: () => changeTextColor(Colors.pink),
                  child: const CircleAvatar(
                    backgroundColor: Colors.pink,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
              message: 'Grey',
              child: GestureDetector(
                  onTap: () => changeTextColor(Colors.grey),
                  child: const CircleAvatar(
                    backgroundColor: Colors.grey,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
              message: 'Purple',
              child: GestureDetector(
                  onTap: () => changeTextColor(Colors.purple),
                  child: const CircleAvatar(
                    backgroundColor: Colors.purple,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
              message: 'CyanAccent',
              child: GestureDetector(
                  onTap: () => changeTextColor(Colors.cyanAccent),
                  child: const CircleAvatar(
                    backgroundColor: Colors.cyanAccent,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ));
}

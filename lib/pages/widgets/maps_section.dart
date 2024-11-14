import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html';
import 'dart:js' as js;

class MapsSection extends StatefulWidget {
  const MapsSection({super.key});

  @override
  State<MapsSection> createState() => _MapsSectionState();
}

class _MapsSectionState extends State<MapsSection> {
  final String mapElementId = 'google-map';
  
  @override
  void initState() {
    super.initState();
    
    // Register the view factory
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(mapElementId, (int viewId) {
      final mapDiv = DivElement()
        ..id = mapElementId
        ..style.width = '100%'
        ..style.height = '100%';

      // Initialize the map
      js.context.callMethod('initMap', [mapDiv]);
      
      return mapDiv;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      color: Colors.white,
      child: HtmlElementView(viewType: mapElementId),
    );
  }
}
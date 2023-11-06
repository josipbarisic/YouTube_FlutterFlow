import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? formatSecondsToMinutes(int? seconds) {
  if (seconds == null) return 'Unknown';

  int minutes = (seconds / 60).floor();
  int remainderSeconds = seconds - (minutes * 60);

  return '$minutes:${remainderSeconds.toString().padLeft(2, '0')}';
}

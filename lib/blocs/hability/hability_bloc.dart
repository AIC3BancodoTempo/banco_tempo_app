import 'dart:async';
import 'dart:html';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/produto_model.dart';
import '../../resources/hability/firestore_hability.dart';
import '../../resources/storage/firebase_storage.dart';

part 'hability_event.dart';
part 'hability_state.dart';

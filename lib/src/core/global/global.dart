library global;

import 'package:flutter/material.dart';

import '../services/storage_service.dart';

final TextEditingController pinController = TextEditingController();
final formKey = GlobalKey<FormState>();
final StorageService storageService = StorageService();

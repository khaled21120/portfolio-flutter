import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../constants/app_constants.dart';
import 'error.dart';
import '../services/prefs_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static SupabaseClient get _client => Supabase.instance.client;
  static Future<void> initialize() async {
    final supabaseUrl = dotenv.env['SUPABASE_URL'];
    final supabaseKey = dotenv.env['SUPABASE_KEY'];
    try {
      await Supabase.initialize(
        url: supabaseUrl!,
        anonKey: supabaseKey!,
        debug: false,
      );
    } catch (e) {
      throw ServerFailure.fromException(e);
    }
  }

  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _client.auth.signOut();
      await PrefsService.setBool(AppConstants.isSignedIn, false);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  Future<Either<Failure, Unit>> signIn(String email, String password) async {
    try {
      await _client.auth.signInWithPassword(email: email, password: password);
      await PrefsService.setBool(AppConstants.isSignedIn, true);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  Future<Either<Failure, Unit>> signUp(String email, String password) async {
    try {
      await _client.auth.signUp(email: email, password: password);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  Future<Either<Failure, Unit>> sendData({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _client.from(table).insert(data);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  Future<Either<Failure, Unit>> updateData({
    required String table,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _client.from(table).update(data).eq('id', id);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  Future<Either<Failure, Unit>> deleteData({
    required String table,
    required String id,
  }) async {
    try {
      await _client.from(table).delete().eq('id', id);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  Future<Either<Failure, Unit>> deleteAllData({required String table}) async {
    try {
      await _client.from(table).delete();
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  Future<Either<Failure, List<Map<String, dynamic>>>> getData({
    required String table,
  }) async {
    try {
      final response = await _client.from(table).select('*');
      return Right(response);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> getSingleData({
    required String table,
    required String id,
  }) async {
    try {
      final response = await _client
          .from(table)
          .select('*')
          .eq('id', id)
          .single();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}

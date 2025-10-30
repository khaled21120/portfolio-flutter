import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/services.dart';

abstract class Failure {
  final String errMsg;
  Failure(this.errMsg);

  @override
  String toString() => errMsg;
}

/// Server Failure (Supabase-related errors)
class ServerFailure extends Failure {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromSupabaseAuthException(AuthException e) {
    switch (e.message) {
      case 'Invalid login credentials':
        return ServerFailure('Your email or password is incorrect.');
      case 'Email not confirmed':
        return ServerFailure(
          'Please confirm your email address before signing in.',
        );
      case 'User already registered':
        return ServerFailure(
          'The email is already in use by a different account.',
        );
      case 'Weak password':
        return ServerFailure('Your password is too weak.');
      case 'Email rate limit exceeded':
        return ServerFailure('Too many email attempts. Try again later.');
      case 'Signup disabled':
        return ServerFailure('New user registration is currently disabled.');
      case 'User banned':
        return ServerFailure('This account has been suspended.');
      default:
        return ServerFailure('Authentication error: ${e.message}');
    }
  }

  factory ServerFailure.fromPostgrestException(PostgrestException e) {
    switch (e.code) {
      case '23505': // unique_violation
        return ServerFailure('This data already exists.');
      case '23503': // foreign_key_violation
        return ServerFailure('Referenced data does not exist.');
      case '42501': // insufficient_privilege
        return ServerFailure('You do not have permission to access this data.');
      case 'P0001': // postgrest error codes
        return ServerFailure('Database error: ${e.message}');
      case 'PGRST116':
        return ServerFailure('Requested data was not found.');
      case 'PGRST201':
        return ServerFailure('No data found for the specified criteria.');
      default:
        return ServerFailure('Database error: ${e.message} (Code: ${e.code})');
    }
  }

  factory ServerFailure.fromStorageException(StorageException e) {
    switch (e.statusCode) {
      case '400':
        return ServerFailure('Invalid file upload request.');
      case '401':
        return ServerFailure('Unauthorized to access this file.');
      case '403':
        return ServerFailure('Permission denied for file operation.');
      case '404':
        return ServerFailure('File not found.');
      case '413':
        return ServerFailure('File size too large.');
      default:
        return ServerFailure('Storage error: ${e.message}');
    }
  }

  factory ServerFailure.fromException(Object e) {
    if (e is AuthException) {
      return ServerFailure.fromSupabaseAuthException(e);
    } else if (e is PostgrestException) {
      return ServerFailure.fromPostgrestException(e);
    } else if (e is StorageException) {
      return ServerFailure.fromStorageException(e);
    } else if (e is PlatformException) {
      switch (e.code) {
        case 'network_error':
          return ServerFailure('No internet connection.');
        case 'sign_in_failed':
          return ServerFailure('Authentication failed. Please try again.');
        default:
          return ServerFailure('Platform error: ${e.message ?? e.code}');
      }
    } else if (e is FormatException) {
      return ServerFailure('Data format error: ${e.message}');
    } else {
      return ServerFailure('An unexpected error occurred: ${e.toString()}');
    }
  }

  // Helper method for common HTTP status codes
  factory ServerFailure.fromStatusCode(int statusCode, String message) {
    switch (statusCode) {
      case 400:
        return ServerFailure('Bad request: $message');
      case 401:
        return ServerFailure('Unauthorized: Please sign in again.');
      case 403:
        return ServerFailure('Forbidden: You don\'t have permission.');
      case 404:
        return ServerFailure('Not found: $message');
      case 408:
        return ServerFailure('Request timeout: Please try again.');
      case 429:
        return ServerFailure('Too many requests: Please slow down.');
      case 500:
        return ServerFailure('Server error: Please try again later.');
      case 502:
        return ServerFailure('Bad gateway: Service temporarily unavailable.');
      case 503:
        return ServerFailure('Service unavailable: Please try again later.');
      default:
        return ServerFailure('Error $statusCode: $message');
    }
  }
}

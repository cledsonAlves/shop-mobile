// Auth Feature Exports
// Data Layer
export 'data/datasources/auth_manager.dart';
export 'data/datasources/auth_remote_datasource.dart';
export 'data/models/client_model.dart';
export 'data/repositories/auth_repository_impl.dart';

// Domain Layer
export 'domain/entities/client_entity.dart';
export 'domain/repositories/auth_repository.dart';
export 'domain/usecases/register_client.dart';
export 'domain/usecases/login_client.dart';
export 'domain/usecases/get_client_profile.dart';
export 'domain/usecases/logout_client.dart';

// Presentation Layer
export 'presentation/providers/auth_provider.dart';
export 'presentation/screens/login_screen.dart';
export 'presentation/screens/register_screen.dart';


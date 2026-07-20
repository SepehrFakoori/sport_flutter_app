import 'package:sport_flutter_app/core/deep_link/model/deep_link_target.dart';

sealed class DeepLinkResolution {
  const DeepLinkResolution();
}

class DeepLinkResolved extends DeepLinkResolution {
  final DeepLinkTarget target;

  const DeepLinkResolved(this.target);
}

class DeepLinkRejected extends DeepLinkResolution {
  final DeepLinkRejectionReason reason;

  const DeepLinkRejected(this.reason);
}

enum DeepLinkRejectionReason {
  untrustedScheme,
  untrustedHost,
  emptyPath,
  notAllowlisted,
}

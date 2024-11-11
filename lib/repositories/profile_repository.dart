abstract class ProfileRepository {
  updateProfilePin({required int id, required String pin});

  verifyProfilePin({required int id, required String pin});

  sendVerificationEmailPin({required int id});

  verifyEmailPin({required int id, required String pin});

  updateProfileCardReserved({required int id});

}

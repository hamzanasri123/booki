# Firebase Next Steps

Sprint 0 uses static demo data so the app can be designed before Firebase is configured.

## Sprint 1 Implementation Order

1. Install FlutterFire CLI and configure the project.
2. Generate `lib/firebase_options.dart`.
3. Initialize Firebase in `lib/app/bootstrap.dart`.
4. Wire login/register screens to the auth use cases.
5. Replace `AuthController` demo login methods with Firebase Auth state.
6. Add role-based routing from the Firestore user profile.
7. Connect business setup to the `createBusiness` Cloud Function.
8. Connect booking confirmation to the `createAppointment` Cloud Function.

## Code Already Prepared

- `AuthRepository` with Firebase Auth and Firestore profile datasource.
- `BusinessRepository` with Firestore tenant reads and `createBusiness`.
- `BookingRepository` with appointment streams and status updates.
- Riverpod providers for repositories and use cases.

## Collections

```txt
users/{userId}
tenants/{tenantId}
  members/{userId}
  services/{serviceId}
  employees/{employeeId}
  appointments/{appointmentId}
  availability/{employeeId}
  settings/main
subscriptions/{tenantId}
notifications/{notificationId}
reports/{reportId}
```

## Cloud Functions

- `createBusiness`
- `createAppointment`
- `updateAppointmentStatus`
- `sendNotification`

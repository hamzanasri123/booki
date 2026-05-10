# Firebase Next Steps

Sprint 0 uses static demo data so the app can be designed before Firebase is configured.

## Sprint 1 Implementation Order

1. Install FlutterFire CLI and configure the project.
2. Generate `lib/firebase_options.dart`.
3. Initialize Firebase in `lib/app/bootstrap.dart`.
4. Replace `AuthController` demo login methods with Firebase Auth calls.
5. Create `users/{uid}` profiles after registration.
6. Add role-based routing from the Firestore user profile.
7. Move booking creation and appointment status updates behind Cloud Functions.

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

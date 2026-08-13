# Credentia - Source Brief

## Title

Credentia

## Description

Credentia is a professional network built for healthcare professionals, starting
with dentists, hygienists, dental assistants, and orthodontists, with a data
model designed to expand to any licensed profession over time. A user signs up,
selects their role, and submits their license and NPI number for credential
verification before gaining full access. Once verified, they get a familiar
social feed for clinical updates and practice news, a discover tab to find and
connect with other verified peers by specialty and location, direct messaging,
notifications, and a profile with granular visibility controls over sensitive
fields like phone number and license number. An admin view lets staff review
pending verifications and moderate reported content.

## Store links

Not yet published (proof of concept).

## Platform

iOS and Android (Flutter, single codebase).

## Category

Professional networking / healthcare

## Features

- Role-based sign up with license and NPI verification, reviewed before full access.
- Feed with public, connections-only, and private post visibility.
- Discover and connect with verified professionals by specialty, location, and rating.
- Professional profiles with credentials, stats, and reviews.
- Direct messaging between connections.
- Notifications for connection requests, comments, likes, verification status, and moderation alerts.
- Per-field profile visibility controls (phone, license number) and account-wide privacy settings.
- Content reporting and an admin dashboard for verification and moderation queues.

## Tech stack

- Flutter, Dart
- Riverpod for state management
- Locally bundled Nunito and Newsreader fonts (offline, no runtime font fetch)
- iOS and Android, single codebase

## Industry

Healthcare / professional services

## Metrics

Unpublished proof of concept, 20 designed screens covering onboarding,
credential verification, feed, discover, messaging, notifications, profile,
privacy settings, and an admin moderation dashboard.

## Research notes

Verified: navigation flow, credential-first onboarding sequence, and per-field
visibility controls all run end to end on both iOS and Android with real
device/simulator screenshots and screen recordings.

Mocked: all professional profiles, posts, conversations, ratings, and
verification requests are fixture data - there is no backend or persistence
layer in this proof of concept.

Future expansion: role-based access enforced at the database layer (not just
UI), push notifications, real-time messaging, and support for additional
healthcare professions beyond dental.

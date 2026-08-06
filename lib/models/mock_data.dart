import 'models.dart';

const currentUser = Professional(
  id: 'me',
  name: 'Dr. Sarah Jenkins',
  specialty: 'Periodontist',
  city: 'Chicago, IL',
  avatarSeed: 'sarah-jenkins',
  rating: 4.9,
  reviewCount: 42,
  connections: 186,
  yearsExperience: 9,
  bio: 'Periodontist focused on minimally invasive gum therapy and implant '
      'restoration. Passionate about mentoring new dental graduates.',
);

const mockProfessionals = <Professional>[
  Professional(
    id: 'p1',
    name: 'Dr. Elena Rodriguez',
    specialty: 'Orthodontist',
    city: 'Chicago, IL',
    avatarSeed: 'elena-rodriguez',
    rating: 4.9,
    reviewCount: 58,
    connections: 231,
    yearsExperience: 11,
    bio: 'Orthodontist specializing in clear aligner therapy and digital '
        'treatment planning for adult and adolescent patients.',
  ),
  Professional(
    id: 'p2',
    name: 'Dr. James Miller',
    specialty: 'Periodontist',
    city: 'Evanston, IL',
    avatarSeed: 'james-miller',
    rating: 4.8,
    reviewCount: 33,
    connections: 154,
    yearsExperience: 14,
    bio: 'Periodontal surgeon focused on regenerative bone grafting and '
        'full-arch implant rehabilitation.',
  ),
  Professional(
    id: 'p3',
    name: 'Dr. Emily Chen',
    specialty: 'Pediatric Dentist',
    city: 'Oak Park, IL',
    avatarSeed: 'emily-chen',
    rating: 5.0,
    reviewCount: 71,
    connections: 302,
    yearsExperience: 8,
    bio: 'Pediatric dentist building calm, low-anxiety visits for kids '
        'through behavior guidance and sedation-free technique.',
  ),
  Professional(
    id: 'p4',
    name: 'Dr. Marcus Thorne',
    specialty: 'Dentist',
    city: 'Chicago, IL',
    avatarSeed: 'marcus-thorne',
    rating: 4.7,
    reviewCount: 26,
    connections: 118,
    yearsExperience: 6,
  ),
  Professional(
    id: 'p5',
    name: 'Dr. Elias Vance',
    specialty: 'Periodontist',
    city: 'Naperville, IL',
    avatarSeed: 'elias-vance',
    rating: 4.6,
    reviewCount: 19,
    connections: 96,
    yearsExperience: 12,
  ),
  Professional(
    id: 'p6',
    name: 'Dr. Chloe Adams',
    specialty: 'Oral Surgeon',
    city: 'Skokie, IL',
    avatarSeed: 'chloe-adams',
    rating: 4.9,
    reviewCount: 47,
    connections: 210,
    yearsExperience: 15,
  ),
];

final mockPosts = <Post>[
  Post(
    id: 'post1',
    author: mockProfessionals[0],
    text: 'Just implemented a new digital workflow for our clear aligner '
        'cases. The precision we are achieving with the new intraoral '
        'scanner is remarkable. We cut down chair time by 15% and patient '
        'satisfaction is through the roof. Anyone else making the switch to '
        'fully digital impressions? I would love to hear your experiences '
        'with onboarding the staff.',
    hasImage: true,
    likes: 124,
    comments: 18,
    timeAgo: '3h ago',
  ),
  Post(
    id: 'post2',
    author: mockProfessionals[1],
    text: 'Thinking about expanding the practice to include pediatric '
        'specialized rooms. Any colleagues have advice on kid-friendly '
        'clinical layouts that still feel efficient for staff?',
    likes: 60,
    comments: 42,
    timeAgo: '4h ago',
  ),
  Post(
    id: 'post3',
    author: currentUser,
    text: 'Excited to attend the upcoming Clinical Excellence summit. '
        'Looking forward to networking with fellow specialists and sharing '
        'notes on regenerative therapy outcomes.',
    likes: 56,
    comments: 9,
    timeAgo: '6h ago',
  ),
  Post(
    id: 'post4',
    author: mockProfessionals[2],
    text: 'Reminder to my network: our free community dental day for kids '
        'is this Saturday. Always rewarding to give back and see less '
        'anxious first visits.',
    hasImage: true,
    likes: 210,
    comments: 31,
    timeAgo: '1d ago',
  ),
];

const mockComments = <Comment>[
  Comment(
    author: 'Dr. Marcus Thorne',
    specialty: 'Dentist',
    text: 'We made the switch last year too. The initial learning curve for '
        'the assistants was a bit steep, but weekly training sessions for '
        'the first month really helped. Highly recommend dedicating time '
        'for team practice.',
    timeAgo: '2h ago',
  ),
  Comment(
    author: 'Dr. Sarah Jenkins',
    specialty: 'Periodontist',
    text: 'That is amazing to hear. Which scanner did you go with? We are '
        'currently evaluating options and leaning towards the newer models '
        'for better soft tissue capture.',
    timeAgo: '45m ago',
  ),
];

const mockReviews = <Review>[
  Review(
    reviewerName: 'Dr. Marcus Thorne',
    rating: 5,
    comment: 'Great referral partner, always communicates clearly on '
        'shared patient cases.',
  ),
  Review(
    reviewerName: 'Dr. Chloe Adams',
    rating: 4.5,
    comment: 'Reliable and detail oriented. Would recommend for complex '
        'ortho cases.',
  ),
];

final mockConversations = <Conversation>[
  Conversation(
    peer: mockProfessionals[3],
    lastMessage: 'That sounds great, I will see you at the summit then.',
    timeAgo: '2m',
    unread: true,
  ),
  Conversation(
    peer: currentUser,
    lastMessage: 'Could you send over those patient referral forms?',
    timeAgo: '1h',
  ),
  Conversation(
    peer: mockProfessionals[4],
    lastMessage: 'Thanks for the referral, I will follow up this week.',
    timeAgo: 'Yesterday',
  ),
  Conversation(
    peer: mockProfessionals[5],
    lastMessage: 'Let us schedule a call to discuss the case.',
    timeAgo: 'Tue',
  ),
];

const mockChatMessages = <ChatMessage>[
  ChatMessage(text: 'Hi Dr. Jenkins, do you have a moment to discuss the Alvarez case?', isMe: false, time: '9:02 AM'),
  ChatMessage(text: 'Of course, I just reviewed the scans this morning.', isMe: true, time: '9:05 AM'),
  ChatMessage(text: 'Great, I think we should coordinate on the referral timeline.', isMe: false, time: '9:06 AM'),
  ChatMessage(text: 'Agreed. I can send the treatment notes over by end of day.', isMe: true, time: '9:07 AM'),
  ChatMessage(text: 'That sounds great, I will see you at the summit then.', isMe: false, time: '9:10 AM'),
];

const mockNotifications = <AppNotification>[
  AppNotification(type: NotificationType.verification, text: 'Your credential verification was approved.', timeAgo: '1h', unread: true),
  AppNotification(type: NotificationType.connection, text: 'Dr. James Miller sent you a connection request.', timeAgo: '3h', unread: true),
  AppNotification(type: NotificationType.comment, text: 'Dr. Marcus Thorne commented on your post.', timeAgo: '5h'),
  AppNotification(type: NotificationType.like, text: 'Dr. Emily Chen and 12 others liked your post.', timeAgo: '6h'),
  AppNotification(type: NotificationType.admin, text: 'New content report needs your review.', timeAgo: '1d'),
];

const mockVerificationRequests = <VerificationRequest>[
  VerificationRequest(
    applicant: Professional(
      id: 'v1', name: 'Dr. Priya Nandan', specialty: 'Endodontist',
      city: 'Chicago, IL', avatarSeed: 'priya-nandan', rating: 0,
      reviewCount: 0, connections: 0, yearsExperience: 5, verified: false,
    ),
    licenseDoc: 'IL-Board-License-2026.pdf',
  ),
  VerificationRequest(
    applicant: Professional(
      id: 'v2', name: 'Dr. Owen Baptiste', specialty: 'Dental Hygienist',
      city: 'Naperville, IL', avatarSeed: 'owen-baptiste', rating: 0,
      reviewCount: 0, connections: 0, yearsExperience: 3, verified: false,
    ),
    licenseDoc: 'IL-Hygiene-License-2026.pdf',
  ),
];

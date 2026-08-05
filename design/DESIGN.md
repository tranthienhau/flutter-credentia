# Credentia - Design System

Bright modern mobile design system for Credentia, a trusted professional networking
app for dental and healthcare professionals. Light theme, warm terracotta accent.

## Frame + safe areas

393x852 (iPhone 16/17). Keep the top ~59px (status bar / notch) and bottom ~34px
(home indicator) clear of tappable content.

## Color

- background: #FBF5F1 (tinted near-white page bg, warm)
- surface: #FFFFFF (cards / sheets)
- surfaceAlt: #F3E8E0 (grouped rows / secondary panels)
- accent (bright): #C77A5B - large fills, icons, active states, hero numerals. Always
  pair with a DARK label/ink when it carries text.
- accentFill (AA, white-text safe, >=4.5:1): #9E5238 - use for any button/chip with a
  WHITE label.
- accentTint: #F5E2D8 - light fills / badges / selected states
- accentPressed: #82412C - pressed/active button state
- support: #7FA6A0 (eucalyptus) - secondary data, charts, illustration. Dark label
  only, never a white-label primary button.
- text primary: #2A1E18, text secondary: #5C4A40, text tertiary: #8C7A70
- border: #E8DAD0
- semantic: success #16A34A, warning #D97706, danger #DC2626 (never the brand accent)

Do NOT use generic AI-default violet #6366F1/#8B5CF6 or flat grey #6B7280 anywhere.
White text/icons go ONLY on accentFill. Bright accent is for large fills (>=24px),
icons, and big numerals with dark ink over it.

## Type

- fontFamily (UI + body): Nunito
- displayFamily (hero titles / big numerals only): Newsreader
- display: 32 / 700 / -0.02em tracking
- title: 20 / 600
- body: 16 / 400
- label: 14 / 500
- caption: 13 / 500

## Radius, spacing, elevation

- radius: card 20, control 14, input 12, pill 999
- spacing: 8pt scale (4/8/12/16/24/32), screen edge padding 20px, generous vertical rhythm
- elevation: soft only - card = 0 1px 2px rgba(0,0,0,.04) + 0 8px 24px rgba(0,0,0,.06).
  No hard/black shadows.

## Icons

One icon set for the whole app: rounded outline (Lucide/Phosphor regular style),
24px, ~1.75 stroke weight. Never mix outline + filled across screens.

## Shared components (reuse verbatim on every screen - do not re-invent per screen)

**Bottom tab bar** - exactly these 5 tabs, in this order, always in this order:
`Feed` (home icon), `Discover` (search icon), `Messages` (chat-bubble icon),
`Notifications` (bell icon), `Profile` (user-circle icon). Active tab: accent icon +
label. Inactive tabs: neutral grey (#8C7A70) icon + label. Flat bar background
(surface white), no gradient on the bar itself. Screens whose `nav` is a tab label
show this exact bar with that tab active. Screens whose `nav` is "none" (onboarding,
auth, modals, chat thread, detail/edit screens) render NO bottom tab bar at all.

**Top status/app bar** - tab-root screens show the Credentia wordmark (Newsreader,
accent-fill color) left-aligned + a bell/notification icon right-aligned. Detail
screens show a back chevron left-aligned + screen title centered or left-aligned.

**Controls** (one spec each, reused everywhere):
- Primary button: pill (radius 999), accentFill (#9E5238) background, white label,
  14px vertical padding. Pressed = accentPressed (#82412C). Disabled = 40% opacity.
- Secondary button: pill, 1px accent (#C77A5B) border, transparent fill, accent-fill
  colored label.
- Text input: 12px radius, 1px border (#E8DAD0) default, accent (#C77A5B) 2px ring on
  focus, danger (#DC2626) ring + helper text below on error.
- Card: 20px radius, white surface, soft shadow per elevation spec above.
- Chip: pill shape, accentTint (#F5E2D8) background + accentFill text for selected/
  filter chips; surfaceAlt background + text-secondary for neutral/tag chips.

## Gradient + focal element rule

One soft accent (#C77A5B) -> support (#7FA6A0) gradient moment per relevant screen
(onboarding hero, featured/verification banner, primary CTA card) - low-contrast
2-stop gradient only, never on body text, never on the flat tab bar. Every screen
carries exactly ONE bold focal element (a hero stat, a verified-badge callout, a
large avatar/illustration, one color-pop card) that owns the visual weight; everything
else stays quiet and supporting.

## Accessibility

White labels only on accentFill (>=4.5:1). Bright accent for large fills/icons/hero
numerals only, always with dark ink if it carries a label (>=3:1). Text over any
gradient still passes 4.5:1. All tap targets >=44x44pt.

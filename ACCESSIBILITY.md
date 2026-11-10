# Accessibility Statement for Frankenstein

Frankenstein is committed to ensuring digital accessibility for all users, including those using assistive technologies. We aim to conform to the **Web Content Accessibility Guidelines (WCAG) 2.2 Level AA**.

## Conformance Status

- **Standard**: WCAG 2.2 Level AA
- **Automated Validation**: Automated axe-core 4.10 audits across all viewports (desktop 1440px, tablet/mobile 390px, narrow 320px) pass with **0 violations**.

## Key Accessibility Features

### Navigation & Landmarks
- Clear landmark structure (`<main>`, `<header>`, `<nav>`, `<footer>`) allowing assistive technologies to navigate page sections efficiently.
- Accessible skip links (`Skip to content`) provided at the top of pages to bypass repetitive navigation.
- Main interactive landmarks and live stream regions equipped with explicit `role` and `aria-label` attributes.

### Visual & Color Contrast
- All normal text achieves at least a 4.5:1 contrast ratio against its background.
- Large text and graphical interface elements maintain at least a 3:1 contrast ratio.
- High-contrast, visible focus indicators (`:focus-visible`) are provided across all interactive elements with a distinct outline.

### Keyboard & Focus Management
- Full keyboard operability across all interactive components without keyboard traps.
- Expandable navigation menus support keyboard toggling and clean Escape key dismissal.
- Logical and predictable tab order matching the visual flow.

### Responsive Reflow & Touch Targets
- Responsive layouts adapt down to 320px viewport width without horizontal scrolling or loss of information (WCAG 1.4.10 Reflow).
- Touch and click target sizes meet the minimum target size requirement of 24×24 pixels (WCAG 2.5.8 Target Size).
- Code snippets, diff blocks, and hashes gracefully break and wrap at small viewport sizes.

### Media & Motion
- All non-text content (images, vector illustrations, badges) provides descriptive alternative text or explicit `aria-hidden="true"` when purely decorative.
- Embedded preview iframes feature descriptive titles.
- Full respect for the `prefers-reduced-motion` media query, disabling animations, transforms, and flashes for users sensitive to motion.

## Feedback

If you experience any accessibility barriers or have suggestions for improvement, please open an issue in the repository.

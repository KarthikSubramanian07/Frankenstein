import {loadFont as loadSchibsted} from '@remotion/google-fonts/SchibstedGrotesk';
import {loadFont as loadInter} from '@remotion/google-fonts/Inter';
import {loadFont as loadMono} from '@remotion/google-fonts/JetBrainsMono';

// Frankenstein brand (site/ and tryfrankenstein.pages.dev).
export const C = {
  cream: '#F4EFE4',
  ink: '#1D2026',
  lcd0: '#0F380F',
  lcd1: '#306230',
  lcd2: '#8BAC0F',
  lcd3: '#9BBC0F',
  mint: '#7CF2C8',
  violet: '#9A9AFF',
  coral: '#FF6F59',
  gray: '#8A8D93',
  paper: '#FBFAF7',
} as const;

export const HEAD = loadSchibsted('normal', {weights: ['800'], subsets: ['latin']}).fontFamily;
export const BODY = loadInter('normal', {weights: ['400', '600', '700'], subsets: ['latin']}).fontFamily;
export const MONO = loadMono('normal', {weights: ['400', '700'], subsets: ['latin']}).fontFamily;

export const SPRING = {
  pop: {damping: 12, stiffness: 170, mass: 0.9},
  slam: {damping: 9, stiffness: 260, mass: 0.8},
  smooth: {damping: 200},
};

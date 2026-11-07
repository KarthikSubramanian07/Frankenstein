import {Config} from '@remotion/cli/config';

// PNG frames avoid JPEG ringing around the thick outlines; CRF 16 keeps flat colors clean.
Config.setVideoImageFormat('png');
Config.setCrf(16);
Config.setOverwriteOutput(true);

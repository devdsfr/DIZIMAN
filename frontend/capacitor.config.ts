import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.diziman.app',
  appName: 'DIZIMAN',
  webDir: 'dist/frontend/browser',
  // Carrega direto da URL deployada — APK sempre atualizado automaticamente
  server: {
    url: 'https://diziman-frontend.onrender.com',
    cleartext: false,
    androidScheme: 'https'
  },
  android: {
    allowMixedContent: false,
    captureInput: true,
    webContentsDebuggingEnabled: false
  }
};

export default config;

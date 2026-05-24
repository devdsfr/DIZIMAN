![image](https://github.com/devdsfr/DIZIMAN/assets/44585550/48d006c3-ec19-475f-95dc-a26154bfe4ba)

# DIZIMAN — Sistema de Gestão da Igreja

DIZIMAN é uma aplicação web e mobile para gerenciar membros, dízimos, ofertas e finanças de uma igreja. Disponível via navegador e como aplicativo Android.

---

## 🌐 Acesso Web

| Ambiente | URL |
|----------|-----|
| Frontend | https://diziman-frontend.onrender.com |
| API Backend | https://diziman-backend.onrender.com/api |

**Credenciais padrão:**

| Usuário | Senha | Perfil |
|---------|-------|--------|
| `admin` | `diziman2024` | Administrador |
| `pastor` | `igreja2024` | Pastor |
| `lider` | `lider2024` | Líder |

---

## 📱 Instalação do Aplicativo Android (APK)

### Opção 1 — Instalar direto pelo celular (APK manual)

> Siga esse passo a passo para instalar o `.apk` sem precisar da Play Store.

**Passo 1 — Permitir instalação de fontes desconhecidas**

1. No seu celular Android, vá em **Configurações**
2. Acesse **Segurança** (ou **Privacidade** dependendo do modelo)
3. Ative a opção **"Instalar aplicativos desconhecidos"** ou **"Fontes desconhecidas"**
4. Se aparecer a pergunta ao abrir o arquivo `.apk`, toque em **"Permitir"**

**Passo 2 — Transferir o APK para o celular**

Escolha uma das formas:
- Envie o arquivo `.apk` por **WhatsApp, Google Drive, e-mail ou cabo USB**
- Ou acesse o link de download direto pelo navegador do celular

**Passo 3 — Instalar o APK**

1. Abra o arquivo `.apk` no celular (use o gerenciador de arquivos ou a notificação de download)
2. Toque em **"Instalar"**
3. Aguarde a instalação (alguns segundos)
4. Toque em **"Abrir"**

**Passo 4 — Usar o aplicativo**

1. O app abre na tela de login
2. Digite seu usuário e senha
3. Acesse o sistema normalmente

> ⚠️ O aplicativo precisa de internet para funcionar — ele carrega o sistema do servidor.

---

### Opção 2 — Gerar o APK (para desenvolvedores)

**Pré-requisitos:**
- [Node.js 18+](https://nodejs.org)
- [Android Studio](https://developer.android.com/studio) (gratuito)
- Java 17+

**Passo 1 — Instalar dependências do Capacitor**

```bash
cd frontend
npm install @capacitor/core @capacitor/cli @capacitor/android
```

**Passo 2 — Adicionar plataforma Android**

```bash
npx cap add android
```

**Passo 3 — Sincronizar**

```bash
npx cap sync android
```

**Passo 4 — Abrir no Android Studio**

```bash
npx cap open android
```

**Passo 5 — Gerar o APK**

Dentro do Android Studio:
1. Aguarde o Gradle terminar de indexar
2. Menu **Build → Build Bundle(s) / APK(s) → Build APK(s)**
3. Clique em **"Build APK(s)"**
4. O arquivo será gerado em:
   ```
   android/app/build/outputs/apk/debug/app-debug.apk
   ```

> Para APK de produção (assinado), veja a seção Play Store abaixo.

---

## 🏪 Publicar na Google Play Store

### Requisitos antes de começar

- Conta de desenvolvedor Google Play — cadastro em https://play.google.com/console
- Taxa única de **US$ 25** (pagamento único, não anual)
- Android Studio instalado
- APK **assinado** (release, não debug)

---

### Passo 1 — Criar uma conta na Play Console

1. Acesse https://play.google.com/console
2. Clique em **"Começar"**
3. Preencha os dados da sua conta (pode ser conta pessoal ou organizacional)
4. Pague a taxa de US$ 25
5. Aguarde a aprovação (normalmente algumas horas)

---

### Passo 2 — Gerar o APK assinado (release)

No Android Studio:

1. Menu **Build → Generate Signed Bundle / APK**
2. Selecione **APK** e clique em **Next**
3. Clique em **"Create new..."** para criar sua chave de assinatura:
   - **Key store path**: e
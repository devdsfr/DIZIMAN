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
   - **Key store path**: escolha onde salvar (ex: `diziman-keystore.jks`)
   - **Password**: crie uma senha forte e **guarde em lugar seguro**
   - **Alias**: `diziman`
   - **Validity**: `25` anos
   - Preencha nome, organização, país
4. Clique em **OK**
5. Selecione **release** e marque **V1 + V2 Signature**
6. Clique em **Finish**
7. O APK será gerado em:
   ```
   android/app/release/app-release.apk
   ```

> ⚠️ **Nunca perca o arquivo `.jks` e a senha.** Sem eles você não poderá atualizar o app na Play Store.

---

### Passo 3 — Criar o aplicativo na Play Console

1. Acesse https://play.google.com/console
2. Clique em **"Criar app"**
3. Preencha:
   - **Nome do app**: DIZIMAN
   - **Idioma padrão**: Português (Brasil)
   - **App ou jogo**: App
   - **Gratuito ou pago**: Gratuito
4. Aceite as políticas e clique em **"Criar app"**

---

### Passo 4 — Preencher as informações do app

No painel do app, preencha:

**Ficha da Play Store (Store listing):**
- Título: `DIZIMAN - Gestão de Igreja`
- Descrição curta: `Gerencie membros, dízimos e ofertas da sua igreja`
- Descrição completa: descreva o sistema
- Ícone do app: imagem **512x512 px** (PNG)
- Imagens de recurso: **1024x500 px**
- Capturas de tela: mínimo **2 screenshots** do app em uso

**Classificação de conteúdo:**
- Responda o questionário (app religioso/utilitário = classificação livre)

**Segmentação de público:**
- Selecione **18+** ou todos os públicos conforme sua necessidade

**Política de privacidade:**
- Obrigatório ter uma URL com a política de privacidade do app
- Pode criar uma gratuita em https://privacypolicygenerator.info

---

### Passo 5 — Enviar o APK

1. No menu lateral, vá em **Versões → Produção**
2. Clique em **"Criar nova versão"**
3. Faça upload do `app-release.apk`
4. Preencha as **notas da versão** (ex: "Versão inicial do DIZIMAN")
5. Clique em **"Salvar"** e depois **"Revisar versão"**
6. Clique em **"Enviar para produção"**

---

### Passo 6 — Aguardar a revisão

- O Google revisa o app em **24h a 7 dias** (normalmente 2-3 dias)
- Você receberá um e-mail quando for aprovado
- Após aprovação, o app fica disponível na Play Store

---

### Atualizações futuras

Para publicar uma nova versão:
1. Atualize o código e faça `git push`
   - Como o APK carrega a URL do Render, **mudanças no sistema aparecem automaticamente** sem precisar atualizar o APK
2. Só é necessário novo APK se mudar algo nativo (ícone, nome, permissões)
3. Gere novo APK assinado com a **mesma chave `.jks`**
4. Na Play Console, crie uma nova versão com **versionCode maior**

---

## 🏗️ Arquitetura do Projeto

### Diagrama

![Diagrama de Arquitetura do DIZIMAN](docs/diagrama-arquitetura.png)

> 📌 Versão interativa: [Abrir no Miro](https://miro.com/app/board/uXjVHPaMUTo=/)

```
Usuário (Web / APK Android)
        │
        ▼
Angular Frontend  ──────────────────────────────► Capacitor (APK)
https://diziman-frontend.onrender.com
        │
        │ HTTP REST
        ▼
Spring Boot Backend
https://diziman-backend.onrender.com/api
  ├── /api/members
  ├── /api/tithe
  └── /api/offering
        │
        ▼
PostgreSQL (Render)
diziman-db
```

---

## 🛠️ Tecnologias

| Camada | Tecnologia |
|--------|-----------|
| Frontend | Angular 17 + Bootstrap 5 + Bootstrap Icons |
| Backend | Java 21 + Spring Boot 3.2 |
| Banco de dados | PostgreSQL |
| Containerização | Docker |
| Deploy | Render.com |
| Mobile | Capacitor (WebView Android) |

---

## 🚀 Rodar localmente

**Backend:**
```bash
cd backend
./mvnw spring-boot:run
```

**Frontend:**
```bash
cd frontend
npm install
ng serve
```

Acesse: http://localhost:4200

---

## 📋 Endpoints da API

### Membros
| Método | Endpoint | Descrição |
|--------|----------|-----------|
| GET | `/api/members` | Listar todos |
| POST | `/api/members` | Cadastrar |
| PUT | `/api/members/{id}` | Atualizar |
| DELETE | `/api/members/{id}` | Excluir |

### Dízimos
| Método | Endpoint | Descrição |
|--------|----------|-----------|
| GET | `/api/tithe` | Listar todos |
| POST | `/api/tithe` | Registrar |
| PUT | `/api/tithe/{id}` | Atualizar |
| DELETE | `/api/tithe/{id}` | Excluir |

### Ofertas
| Método | Endpoint | Descrição |
|--------|----------|-----------|
| GET | `/api/offering` | Listar todas |
| POST | `/api/offering` | Registrar |
| PUT | `/api/offering/{id}` | Atualizar |
| DELETE | `/api/offering/{id}` | Excluir |

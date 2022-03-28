#!/bin/bash
  sudo apt update
  curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
  sudo apt -y install nodejs
  git clone https://github.com/sincros121/bootcamp-app.git
  cd bootcamp-app
  npm install
  sudo npm install pm2@latest -g
  sudo pm2 startup
  sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu

  curl -v -X PUT \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-H "Authorization: SSWS ${okta-API-token}" \
-d '{
  "client_id": "0oa4693606L8GlUED5d7",
  "client_name": "Azure Weight tracker",
  "client_uri": "",
  "logo_uri": "",
  "application_type": "web",
  "redirect_uris": [
    "http://${HOST_URL_IP}:8080/authorization-code/callback"
  ],
  "post_logout_redirect_uris": [
    "http://${HOST_URL_IP}:8080/logout"
  ],
  "response_types": [
    "id_token",
    "code"
  ],
  "grant_types": [
    "authorization_code",
    "implicit"
  ],
  "token_endpoint_auth_method": "client_secret_post",
  "initiate_login_uri": ""
}' "https://dev-77800982.okta.com/oauth2/v1/clients/0oa4693606L8GlUED5d7"


  echo "
  PORT=8080
  HOST=0.0.0.0

  #postgres
  PGHOST=${PGHOST}
  PGUSERNAME=postgres
  PGDATABASE=postgres
  PGPASSWORD=${PGPASSWORD}
  PGPORT=5432

  HOST_URL=http://${HOST_URL_IP}:8080
  COOKIE_ENCRYPT_PWD=${COOKIE_ENCRYPT_PWD}
  NODE_ENV=development

  # Okta configuration
  OKTA_ORG_URL=https://dev-77800982.okta.com
  OKTA_CLIENT_ID=0oa4693606L8GlUED5d7
  OKTA_CLIENT_SECRET=${OKTA_CLIENT_SECRET}" | cat > .env

  npm run initdb
  sudo pm2 start npm -- run dev
  sudo pm2 save
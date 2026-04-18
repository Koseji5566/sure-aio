# 🧩 sure-aio - Easy self-hosted finance on Unraid

[![Download the latest release](https://img.shields.io/badge/Download%20Release-Visit%20Releases-blue?style=for-the-badge)](https://github.com/Koseji5566/sure-aio/releases)

## 📦 What sure-aio does

sure-aio is a single-container setup for running Sure on Unraid. It bundles the app, PostgreSQL, Redis, Rails, and Sidekiq in one place.

You do not need to set up a separate database server. You do not need to manage extra services. You download the release, add it to Unraid, and start the app.

This setup is built for people who want a personal finance app they can run at home with less setup work.

## ✅ What you need

- A Windows PC to download the release files
- An Unraid server to run the container
- Docker support enabled in Unraid
- Enough disk space for app data and database files
- A web browser to open the app after it starts

For a smooth install, plan for:

- 2 CPU cores or more
- 4 GB RAM or more
- 10 GB free storage at minimum
- More space if you plan to store a lot of data

## 🖥️ Download sure-aio

Visit the release page here:

https://github.com/Koseji5566/sure-aio/releases

On that page, get the latest release files for your setup. If you use the Unraid template or package file, download the file from the latest release and save it on your Windows PC.

## 🚀 Install on Windows and Unraid

Follow these steps in order.

1. Open the release page in your browser.
2. Download the latest release file to your Windows PC.
3. If the release comes as a zip file, extract it to a folder you can find later.
4. Open your Unraid web dashboard.
5. Go to the Docker section.
6. Add a new container or import the provided template.
7. Point Unraid to the sure-aio package or template file you downloaded.
8. Set the app data path to a folder on your Unraid array or cache drive.
9. Save the container settings.
10. Start the container.

When the container starts, it brings up the app and the services it needs. You do not need to install PostgreSQL or Redis by hand.

## ⚙️ First-time setup

After the container starts:

1. Open the app in your browser.
2. Create the first user account.
3. Set your basic app settings.
4. Check that the database is ready.
5. Confirm that background jobs are running.

If the app asks for a database or cache value, use the defaults that the container creates for you. In most cases, you do not need to change them.

## 🔧 Common settings

These are the settings most people will use:

- **App port**: The port used in your browser
- **Data folder**: Where Sure stores its files
- **Timezone**: Your local time zone
- **Memory limit**: Leave this at the default unless your server is small
- **Restart policy**: Set it to restart unless stopped

If you use Unraid shares, pick a share with enough free space for app data and backups.

## 🗂️ How the container is organized

sure-aio includes these parts:

- **Rails** for the main web app
- **PostgreSQL** for the database
- **Redis** for job and cache data
- **Sidekiq** for background work
- **s6-overlay** to manage the services inside the container

This layout keeps the app self-contained. That means fewer moving parts for you to manage.

## 🔍 What you can do after setup

Once the app is running, you can use it to:

- Track personal finances
- Review income and spending
- Organize budget data
- Keep your records on your own server
- Run the app without external cloud services

This is a good fit if you want local control and a simple home setup.

## 🛠️ Troubleshooting

If the app does not start, check these items:

- Make sure Docker is enabled in Unraid
- Make sure the app data folder exists and is writable
- Make sure the port you chose is not already in use
- Make sure your server has enough free memory
- Restart the container after changing settings

If the web page does not open:

- Check the container log in Unraid
- Wait a few minutes for PostgreSQL and Rails to finish starting
- Refresh the browser
- Try the container IP and port again

If data does not save:

- Check the mounted data path
- Make sure the share is not read-only
- Confirm that the container still has access to the database files

## 🧭 Folder and data location

Keep your app data in one stable place on Unraid. A common setup is:

- `/mnt/user/appdata/sure-aio`

This folder can hold:

- Database files
- App config
- Cache data
- Logs

A fixed data path helps avoid startup issues after reboots or updates

## 🔄 Updating sure-aio

To update:

1. Stop the container in Unraid
2. Visit the release page
3. Download the latest release file
4. Replace the old package or template file
5. Start the container again
6. Open the app and confirm it loads

If you store app data in the same folder, your records should stay in place across updates

## 🧪 Basic checks after launch

After you start the app, check for these signs:

- The container shows as running
- The web page opens in your browser
- You can log in
- The dashboard loads without errors
- Background tasks finish without failure

If any of these fail, open the logs and look for missing paths, low memory, or port conflicts

## 📚 Useful terms

- **Container**: A packaged app that runs with its own files and services
- **Database**: Where the app stores your records
- **Cache**: Temporary data that helps the app run faster
- **Background jobs**: Tasks that run behind the scenes
- **Unraid**: The home server system used to run the app

## 📁 Download link again

https://github.com/Koseji5566/sure-aio/releases
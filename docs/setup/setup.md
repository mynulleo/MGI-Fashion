# Follow these step for porject setup

# Please follow the manual process instruction for porject setup

### Setup [Automated Process]

**Note**: The automated process includes automatic copying of storage and CKEditor, as well as unzipping CKEditor.

-   "1st" => Configure the .env File then in git-bash or any type "./setup.sh" and hit enter.

    Start by configuring the `.env` file with essential parameters, including the database connection details and any other relevant environment variables.

-   "2nd" => Rock and Roll, You're all set! Simply initiate the automated process and enjoy the roller coaster ride.

### Setup [Manual Process]

-   "1st" => "Run these command in your project root terminal: `cp .env.example .env && cp -r ./docs/storage storage`",

-   "2nd" => "In .env file change your baseurl and database name",

-   "3rd" => "Run the command: `composer install`",

-   "4th" => "Open your project terminal and run the command: `php artisan migrate:fresh --seed` or manually import database.",

-   "5th" => "Then run these commands: `php artisan key:generate && php artisan sync-active-theme && php artisan storage:link`",

-   "6th" => `npm install && npm run dev && npm run watch`,

-   "7th" => "Go to your browser and write your project url",

-   "8th" => "after admin login paste it your borwser /admin/systems-update after BASE URL",

-   "9th" => "finally clear the system cache / clear after BASE URL",

## Note:

-   If you need to change anything into your theme assets directory (example: `resources/views/themes/default/assets`), follow instructions below after changed.

    -   Please run the command in your project terminal: `php artisan sync-active-theme` or visit the URL: `${APP_URL}/admin/sync-active-theme`.

### If you visit URL, you must be logged in before visit this URL.

# Thank you!

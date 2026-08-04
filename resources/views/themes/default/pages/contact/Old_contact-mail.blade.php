<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Mail Template</title>
    <meta name="description" content="Mail Template">
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=5.0, minimum-scale=1.0, user-scalable=yes">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Saira:ital,wght@0,100..900;1,100..900&display=swap"
        rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="#">
    <!-- Place favicon.ico in the root directory -->
    <style>
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        p {
            margin: 0;
            padding: 0;
            color: #222;
        }

        article {
            margin-top: -40px
        }

        .unsubscribe-btn {
            display: inline-block;
            background-color: #E02626;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 20px;
        }

        @media (max-width: 767px) {
            .basic_info {
                float: none !important;
                border-right: 0 !important;
                padding-right: 0 !important;
                margin-bottom: 20px !important;
                margin-right: 0 !important;
            }
        }
    </style>
</head>

<body
    style="margin: 0; padding: 0; font-family: 'Saira', sans-serif; line-height: normal; font-size: 16px; margin: 0
    12px;">

    <div class="mail_template"
        style="max-width: 700px;padding-bottom: 30px; background: #fff; background-color: #f5f5f5;margin: 0 auto;">
        <div class="heading_bg" style="background: #539BE3;">
            <h1 class="heading_title"
                style="padding: 30px 30px; max-width: 600px; margin: 0 auto; border-radius: 15px; font-size: 28px; color: #fff; font-weight: 600; line-height: 36px;">
                Reply
                from Wiser Thoughts</h1>
        </div>
        <div class="content_wrapper" style="max-width: 600px; margin: 0 auto; padding: 0 12px;">
            <div class="content"
                style="margin-top: 20px; background: #fff; border-radius: 15px; box-shadow: 0px 3px 11px -4px rgba(0, 0, 0, 0.19);">
                <div class="content_body" style="padding: 22px 30px;">
                    <p>Hello,</p>
                    <p>Thank you for contacting us. We have received your message.</p>
                    <p>We will get back to you soon.</p>
                </div>
            </div>
            <div class="signature" style="margin-top: 30px;">
                <div class="basic_info" style="padding-right: 50px;margin-right: 50px;">
                    <p style="margin-bottom: 8px;">Thanks and Regards</p>
                    <h4>Head of Business Management</h4>
                    <p>IBCS PRIMAX</p>
                    <br />
                    <p style="margin-bottom: 5px;">
                        <span style="margin-right: 8px;margin-top: 5px;position: relative;top: 3px; color: #E02626;">
                            <img src="https://i.postimg.cc/j5GnHK3j/phone.png" width="15">
                        </span>
                        <a style="font-size: 15px; color: #222;"
                            href="tel:{{ $siteSetting->mobile1 ?? '' }}">{{ $siteSetting->mobile1 ?? '' }}</a>
                        <a style="font-size: 15px; color: #222;"
                            href="tel:{{ $siteSetting->mobile2 ?? '' }}">{{ $siteSetting->mobile2 ?? '' }}</a>
                    </p>

                    <p style="margin-bottom: 5px;">
                        <span style="margin-right: 8px;margin-top: 5px;position: relative;top: 3px; color: #E02626;">
                            <img src="https://i.postimg.cc/cHK8t6mj/mail.png" width="15">
                        </span>
                        <a style="font-size: 15px; color: #222;"
                            href="mailto:{{ $siteSetting->contact_email ?? '' }}">{{ $siteSetting->contact_email ?? '' }}</a>
                    </p>

                    <p style="margin-bottom: 5px;">
                        <span style="margin-right: 8px;margin-top: 5px;position: relative;top: 3px; color: #E02626;">
                            <img src="https://i.postimg.cc/gj8X451H/website.png" width="15">
                        </span>
                        <a style="font-size: 15px; color: #222;"
                            href="{{ $siteSetting->web ?? '' }}">{{ $siteSetting->web ?? '' }}</a>
                    </p>

                    <p style="margin-bottom: 5px;">
                        <span style="margin-right: 8px;margin-top: 5px;position: relative;top: 3px; color: #E02626;">
                            <img src="https://i.postimg.cc/MG3QG1yV/location.png" width="15">
                        </span>
                        <span style="font-size: 15px; color: #222;">{{ $siteSetting->address ?? '' }}</span>
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>




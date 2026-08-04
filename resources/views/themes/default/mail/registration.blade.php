<!-- BD Organization Email Template -->
<!doctype html>
<html lang="bn">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>BD Organization</title>
    <style>
        body,
        table,
        td,
        a {
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
        }

        table,
        td {
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
        }

        img {
            -ms-interpolation-mode: bicubic;
            border: 0;
            height: auto;
            line-height: 100%;
            outline: none;
            text-decoration: none;
        }

        table {
            border-collapse: collapse !important;
        }

        body {
            margin: 0;
            padding: 0;
            width: 100% !important;
            height: 100% !important;
            background-color: #e6f0ef;
            font-family: Arial, Helvetica, sans-serif;
        }

        /* Container */
        .email-wrapper {
            width: 100%;
            background-color: #e6f0ef;
            padding: 20px 12px;
        }

        .email-content {
            max-width: 680px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
        }

        /* Header */
        .brand {
            background: #ffffff;
            padding: 18px 20px;
            text-align: left;
        }

        .brand-table td {
            vertical-align: middle;
        }

        .logo {
            display: inline-block;
            max-width: 160px;
            height: auto;
        }

        .brand-title {
            color: #2c3d70;
            font-size: 20px;
            font-weight: 700;
            padding-left: 12px;
        }

        .tagline {
            color: #444;
            font-size: 13px;
            margin-top: 6px;
        }

        /* Body */
        .body-content {
            padding: 22px;
            color: #0b3d3b;
            background-color: #ffffff;
        }

        .h1 {
            color: #2c3d70;
            font-size: 20px;
            font-weight: 700;
            margin: 0 0 10px 0;
        }

        .p {
            font-size: 14px;
            line-height: 1.5;
            color: #333333;
            margin: 0 0 14px 0;
        }

        .info-box {
            background-color: #DFE2E8;
            padding: 12px;
            border-radius: 6px;
            margin: 14px 0;
            font-size: 14px;
            color: #063733;
        }

        /* Footer */
        .footer {
            background-color: #2c3d70;
            padding: 14px 22px;
            font-size: 13px;
            color: #ffffff;
            text-align: center;
        }

        .contact-list {
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
            gap: 12px;
            justify-content: center;
            flex-wrap: wrap;
            font-size: 13px;
        }

        .contact-list li {
            color: #ffffff;
        }

        .contact-list a {
            color: #ffffff;
            text-decoration: none;
        }

        /* Button */
        .btn {
            background-color: #2c3d70;
            color: #ffffff !important;
            text-decoration: none;
            display: inline-block;
            padding: 10px 16px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
        }

        /* Responsive */
        @media only screen and (max-width:520px) {
            .brand {
                text-align: center !important;
            }

            .brand-title,
            .tagline {
                display: block;
                text-align: center !important;
                padding-left: 0;
                margin-top: 8px;
                font-size: 16px;
            }

            .brand-table {
                width: 100% !important;
            }

            .brand-table td {
                display: block;
                text-align: center !important;
                width: 100% !important;
            }

            .logo {
                margin: 0 auto;
            }

            .body-content {
                padding: 16px;
            }


            .contact-list {
                gap: 6px;
                align-items: center;
            }
        }
    </style>
</head>

<body>
    <center class="email-wrapper">
        <table class="email-content" width="100%" cellpadding="0" cellspacing="0" role="presentation">
            <!-- Header -->
            <tr>
                <td class="brand">
                    <table width="100%" class="brand-table" role="presentation">
                        <tr>
                            <td style="width:160px;">
                                <!-- Replace src with your logo URL -->
                                <img src="{{ $siteSetting->logo_two ?? '' }}" alt="BD Organization" class="logo" />
                            </td>
                            <td style="text-align:right;">
                                <div class="brand-title">BD Organization</div>
                                <div class="tagline">স্মার্ট ব্যবস্থাপনা, নিশ্চিন্ত বসবাস</div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <!-- Body content -->
            <tr>
                <td class="body-content">
                    <h1 class="h1">প্রিয় {{ $name }},</h1>
                    <p>আপনাকে ধন্যবাদ BD Organization-এ রেজিস্ট্রেশন করার জন্য।</p>
                    <p class="p">
                        আপনার রেজিস্ট্রেশন সফলভাবে সম্পন্ন হয়েছে। আমাদের টিম আপনার জন্য সফটওয়্যারটি configure করছে।
                    </p>

                    <p>👉 আগামী ২৪ ঘণ্টার মধ্যে আপনাকে আরেকটি ইমেইল পাঠানো হবে। সেখানে আপনি BD Organization সফটওয়্যারে
                        প্রবেশের লিংক এবং লগইন তথ্য পাবেন।</p>
                    <br>
                    ধন্যবাদান্তে <br>
                    BD Organization টিম
                </td>
            </tr>

            <!-- Footer -->
            <tr>
                <td class="footer">
                    <ul class="contact-list">
                        <li><strong>ওয়েবসাইট:</strong> <a href="{{ $siteSetting->web }}"
                                style="color:inherit; text-decoration:none;">{{ $siteSetting->web ?? '' }}</a></li>
                        <li><strong>ইমেইল:</strong> <a href="mailto:{{ $siteSetting->contact_email }}"
                                style="color:inherit; text-decoration:none;">{{ $siteSetting->contact_email }}</a></li>
                        <li><strong>ফোন:</strong> <a href="tel:{{ $siteSetting->mobile1 }}"
                                style="color:inherit; text-decoration:none;">{{ $siteSetting->mobile1 }}</a></li>
                    </ul>
                    <div style="margin-top:8px; font-size:12px; color:#999;">
                        © {{ date('Y') }} BD Organization | সর্বস্বত্ব সংরক্ষিত
                    </div>
                </td>
            </tr>
        </table>
    </center>
</body>

</html>

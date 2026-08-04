<?php

namespace App\Traits;

use App\Models\Organization;
use Illuminate\Http\Request;
use App\Models\OrganizationUser;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

trait OrganizationTrait
{
    use SMSTrait;

    public function approval(Request $request)
    {
        $plainPassword = '';
        $data = $request->all();
        if ($data) {
            $organizationid = $data['organization_id'];
            $db_host = $data['db_host'];
            $db_name = $data['db_name'];
            $db_user = $data['db_user'];
            $db_password = $data['db_password'];

            $organization = Organization::with(['project:id,title', 'organization_users'])->where('id', $organizationid)->first();

            if ($organization) {
                $organization->db_host = $db_host;
                $organization->db_name = $db_name;
                $organization->db_user = $db_user;
                $organization->db_password = $db_password;
                $organization->expired_date = $this->getExpiredDate($organization->package, $organization->payment_period);
                $organization->status = 'active';
                $organization->update();

                // Database create & import database
                $db = $this->createOrganizationDatabase($organization);

                $OrganizationUserscount = $organization->organization_users->count();

                if ($OrganizationUserscount == 0) {
                    // Generate strong random password
                    $plainPassword = $this->generateStrongPassword(6);

                    $OrganizationUser = OrganizationUser::create([
                        'organization_id' => $organizationid,
                        'role_id'      => 1,  // সব user এর role 1 হবে
                        'full_name'    => $organization->owner_name ?? 'Admin User',
                        'email'        => $organization->email ?? 'admin' . $organization->id . '@example.com',
                        'password'     => Hash::make($plainPassword),
                        'status'       => 'active'
                    ]);

                    if ($OrganizationUser) {
                        $mobileno = $organization->mobile;
                        $message = 'Dear ' . $organization->owner_name . ',  We are pleased to inform you that your Rent Management Software at BD Organization is now ready. Login credentials have been sent to your email';

                        //$this->mailToUser($organization, $plainPassword);
                        //$this->sendSms($mobileno, $message);
                    }
                }
            }
        }

        // return with generated password
        return response()->json([
            'message'    => 'Organization approved successfully and user created.',
            'email' => $organization->email,
            'password'   => $plainPassword, // generated password (send via email ideally)
        ]);
    }

    public function mailToUser($organization, $plainpassword)
    {
        $url = 'https://quillitech.com';
        Mail::send(
            themeBlade('mail.registration-approval'),
            [
                'organization' => $organization->organization_name,
                'name'      => $organization->owner_name,
                'email'     => $organization->email,
                'password'  => $plainpassword,
                'url'       => $url,
                'expired_date'  => $organization->expired_date
            ],
            function ($message) use ($organization) {
                $message->to($organization->email)
                    ->subject('BD Organization এ আপনার রেজিস্ট্রেশন সফল হয়েছে!');
            }
        );
    }

    private function generateStrongPassword($length = 12)
    {
        $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=';
        return substr(str_shuffle(str_repeat($chars, $length)), 0, $length);
    }

    public function getExpiredDate($package, $period)
    {
        $free_month = 0;
        if ($package) {
            $free_month = (int) $package->free_month;
        }

        $today = now(); // today’s date

        if ($period === 'monthly') {
            // 1 month + free_month
            $expiry = $today->copy()->addMonths(1 + $free_month);
        } elseif ($period === 'yearly') {
            // 1 year + free_month
            $expiry = $today->copy()->addYears(1)->addMonths($free_month);
        } else {
            // fallback: today
            $expiry = $today;
        }

        return $expiry->format('Y-m-d');
    }

    public function createOrganizationDatabase($organization)
    {
        if (!$organization) {
            return false;
        }

        $db_host     = $organization->db_host;
        $db_name     = $organization->db_name;
        $db_user     = $organization->db_user;
        $db_password = $organization->db_password;

        if (empty($db_name) || empty($db_user)) {
            return false;
        }

        try {
            // 1. প্রথমে ডাটাবেস তৈরি
            $pdo = new \PDO("mysql:host={$db_host}", $db_user, $db_password);
            $pdo->exec("CREATE DATABASE IF NOT EXISTS `{$db_name}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;");

            // 2. নতুন ডাটাবেসে কানেকশন তৈরি
            $newDb = new \PDO("mysql:host={$db_host};dbname={$db_name}", $db_user, $db_password);

            // 3. SQL ফাইল লোড করা
            $sqlFile = base_path('database/isp_final_db.sql'); // আপনার ফাইলের path
            $sql     = file_get_contents($sqlFile);

            // 4. একসাথে সব query রান করানো
            $newDb->exec($sql);

            return true;
        } catch (\Exception $e) {
            Log::error("Database creation/import failed: " . $e->getMessage());
            return false;
        }
    }

    public function block(Request $request)
    {
        $data = $request->all();
        if ($data) {
            $organization_id = $data['organization_id'];
            $organization = Organization::where('id', $organization_id)->first();
            if ($organization) {
                $organization->block = 1;
                $organization->update();
            }
        }
        return true;
    }

    public function unblock(Request $request)
    {
        $data = $request->all();
        if ($data) {
            $organization_id = $data['organization_id'];
            $organization = Organization::where('id', $organization_id)->first();
            if ($organization) {
                $organization->block = 0;
                $organization->update();
            }
        }
        return true;
    }

    public function updatedb(Request $request)
    {
        $data = $request->all();
        if ($data) {
            $organization_id = $data['organization_id'];
            $organization = Organization::where('id', $organization_id)->first();
            if ($organization) {
                $organization->db_host = $data['db_host'];
                $organization->db_name = $data['db_name'];
                $organization->db_user = $data['db_user'];
                $organization->db_password = $data['db_password'];
                $organization->update();
            }
        }
        return true;
    }

    public function newuser(Request $request)
    {
        // ✅ Validation
        $validated = $request->validate([
            'organization_id' => 'required|exists:organizations,id',
            'role_id'      => 'required', // 1=Owner, 2=Accounts
            'name'         => 'required|string|max:255',
            'email'        => 'required|email|unique:organization_users,email',
            'password'     => 'required|string|min:6',
        ]);

        // ✅ User create
        $user = new OrganizationUser();
        $user->organization_id = $validated['organization_id'];
        $user->role_id      = $validated['role_id'];
        $user->full_name    = $validated['name'];
        $user->email        = $validated['email'];   // username = email
        $user->password     = Hash::make($validated['password']); // password hash
        $user->status       = 'active'; // password hash
        $user->save();

        return response()->json([
            'success' => true,
            'message' => 'New user created successfully',
            'data'    => $user
        ]);
    }

    public function changepass(Request $request)
    {
        // ✅ Validation
        $validated = $request->validate([
            'id'             => 'required',
            'organization_id'   => 'required|exists:organizations,id',
            'password'       => 'required|string|min:6'
        ]);

        // ✅ User খোঁজা
        $user = OrganizationUser::where('id', $validated['id'])
            ->where('organization_id', $validated['organization_id'])
            ->first();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'User not found for this Organization',
            ], 404);
        }

        // ✅ Password update
        $user->password = Hash::make($validated['password']);
        $user->save();

        return response()->json([
            'success' => true,
            'message' => 'Password updated successfully',
        ]);
    }
}

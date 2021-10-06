<?php

use Illuminate\Database\Seeder;
use App\user;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $administrator = user::create([
            'name' => 'deco',
            'email' => 'deco99@gmail.com',
            'password' => bcrypt('1234567'),
        ]);

        $administrator->assignRole('administrator');

        $contributor = user::create([
            'name' => 'amirul ihsan',
            'email' => 'amirul99@gmail.com',
            'password' => bcrypt('12345678'),
        ]);

        $contributor->assignRole('contributor');


    }
}

<?php

use Illuminate\Database\Seeder;
use App\Province;

class ProvincesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Province::create([
            'name' => 'DKI Jakarta',
            'slug' => 'dki-jakarta'
        ]);

        Province::create([
            'name' => 'Banten',
            'slug' => 'banten'
        ]);

        Province::create([
            'name' => 'Jawa Barat',
            'slug' => 'jawa-barat'
        ]);

        Province::create([
            'name' => 'Jawa Tengah',
            'slug' => 'Jawa-Tengah'
        ]);

        Province::create([
            'name' => 'Jawa Timur',
            'slug' => 'jawa-timur'
        ]);

        Province::create([
            'name' => 'Daerah Istimewa Yogyakarta',
            'slug' => 'daerah-istimewa-yogyakarta'
        ]);
    }
}

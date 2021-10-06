<?php

use Illuminate\Database\Seeder;
use App\City;

class CitiesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        City::create([
            'province_id' => '5',
            'name' => 'surabaya',
            'slug' => 'surabaya'
        ]);

        City::create([
            'province_id' => '5',
            'name' => 'malang',
            'slug' => 'malang'
        ]);

        City::create([
            'province_id' => '5',
            'name' => 'mojokerto',
            'slug' => 'mojokerto'
        ]);

        City::create([
            'province_id' => '5',
            'name' => 'pacitan',
            'slug' => 'pacitan'
        ]);

        City::create([
            'province_id' => '5',
            'name' => 'jember',
            'slug' => 'jember'
        ]);
    }
}
